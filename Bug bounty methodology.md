# My bug bounty methodology and how I approach a target

[April 22, 2021](https://thehackerish.com/my-bug-bounty-methodology-and-how-i-approach-a-target/) by thehackerish

Last time, I showed you [the best resources I use to stay up to date](https://thehackerish.com/the-top-9-bug-bounty-resources-to-stay-up-to-date) in bug bounty hunting. Today, I will share with you my bug bounty methodology when I approach a target for the first time. This is going to be divided into several sections. First, I will show how I choose a bug bounty program. Then, I will dive into how I enumerate the assets. From there, I will explain how I pick a web application and how I test it. Finally, I will evaluate this bug bounty methodology by enumerating its pros and cons so that you know exactly what to expect from it. There are plenty of bug bounty tips and tricks along the way, so make sure to stick around until the end.

## How I choose a bug bounty program

When I first started hacking, [Hacker101](https://www.hacker101.com/) didn’t exist yet. I had to work on public programs which were tough to crack. In fact, there is simply a lot of competition on those programs with the level of expertise I had. Luckily, you don’t have to struggle as before. If you’ve seen my previous episodes, you have probably earned your first 26 points on Hacker101 by now and got your first private invite from a bug bounty program. If you haven’t done it yet, then you’re probably starting your bug bounty hunting journey on the wrong foot.

Anyways, let’s assume you have received some private invitations. How would you choose between them? What program would you pick to start hunting for bugs? On [HackerOne](https://hackerone.com/) where I primarily hunt for bugs, I choose a program based on key metrics shown to me during the invitation process.


HackerOne program displaying some metrics of its bug bounty program

### Program launch date

First, I see where the bug bounty program was launched to have an idea of how old the program is. This tells me whether I should spend some time on low hanging fruits or dig deeper during my testing, because, unless there are new assets, most of the easy bugs would have already been found in an old program.

### Program responsiveness

The second thing I look for is the response posture. In short, I see what is the average time to resolve a security issue. If the program takes a lot of time to resolve security issues, it means that there is a higher chance of getting duplicates. Usually, all other response metrics, such as time to first response, time to triage and time to bounty are lower than the resolution time, so the shorter it is, the better.\
You can also see the percentage of the reports which have met those response metrics. If it is above 90%, I’d probably accept the invitation if the rest of the metrics is ok.

### The scope of the bug bounty program

I usually prefer bigger scopes. For example, I would prefer wildcard domains over a single web application. It reduces competition because there is enough room to play with different assets, and it makes the target less boring. However, I might accept a program with a small scope program if they have a great response time or good rewards.

### Bug bounty rewards

This is another criteria I look for. If I am investing my time looking for security bugs, I would like to have a bigger return on my investment. So I would prefer higher paying bug bounty programs. I usually avoid programs with no rewards not only because of money, but also because the reputation you get is significantly lower.

### The business of the company

If all the previous metrics look good to me, I still have to check if the company’s business matches my values. If it doesn’t, I simply reject the invitation.

Alright, now that I have chosen the bug bounty program, how do I approach it? Well, I start with a light subdomain enumeration to gauge the public presence of the bug bounty program and quickly find something to work on. I used to do thorough enumeration, but I realized that it takes considerable time. Because this is my first interaction with the target, I feel it’s a bit early to perform a heavy enumeration.

What does my bug bounty methodology look like for subdomain enumeration?

I start my subdomain enumeration with Tomnomnom’s [assetfinder](https://github.com/tomnomnom/assetfinder) tool. The command is straightforward, you just provide your in-scope wildcard domain name.

```
assetfinder --subs-only domain.name
```

The thing I love about this tool is that it’s blazingly fast! It provides me with a quick idea of the subdomains naming convention and gives me initial assets to work on.\
I always avoid brute force at this stage. On the one hand, it takes more time which I prefer to invest in the next steps. On the other hand, I like to increase my success rate by bruteforcing with a custom wordlist tailored just for this domain.

## Bug bounty methodology to enumerate web applications

Now that I have a list of assets, I filter only web applications using Tomnomnom’s [httprobe](https://github.com/tomnomnom/httprobe). For now, all I’m interested in are ports 80 and 443. The command is again easy to run:

```
cat domains | httprobe
```

As a side note, if the program is new, I would probably use [Shodan](https://www.shodan.io/) or perform a port scan using [masscan](https://github.com/robertdavidgraham/masscan) to see if any web applications are running on non-standard open ports. These are ports greater than 1024.\
Lastly, I run [aquatone](https://github.com/michenriksen/aquatone) to screenshot the list of live web applications. There are two reasons I do that. On the one hand, I will be able to quickly spot any visual deviation from the common user interface. On the other hand, I will get a bird’s eye view of the different web application categories and technologies. This is possible because aquatone groups similar user interfaces together and displays the web applications’ technologies in the HTML results.

## My bug bounty methodology when choosing a web application

Hopefully, I now have some web applications to choose from. I tend to choose the one which deviates from the herd. For example, if all web applications implement a centralized Single Sign-on authentication mechanism, I would look for any directly accessible asset. If I spot a user interface of common software such as monitoring tools, or known Content Management Systems, I would target them first. Another example is when the application discloses the name and the version of the software being used. In this case, I look online for any available exploits. If I am lucky, I might get easy issues to report.

For the other custom-made web applications, I will generally choose the one whose user interface deviates from the common company’s theme. If I don’t find one, I might repeat my previous steps with deeper enumeration. For instance, I would take the subdomains I found earlier and combine them with the name of the company to generate a custom wordlist. Then, I’d use tools like [OWASP amass](https://github.com/OWASP/Amass) and brute force the subdomains using the wordlist I constructed.

## How I approach a web application

Finally, the time comes for actually engaging with the web application and looking for security bugs. You must reduce the time between your first interaction with the program and this phase. Otherwise, you will be wasting your time doing only recon. In this phase, my bug bounty methodology consists of enumerating as much as possible to draw the largest attack surface possible.

### Mapping the application features

This is where I open up my web browser and use the application as a normal user. If there is a signup feature, I create a user and I login. Then, I make sure to visit every tab, click on every link, fill up every form. If it’s an e-commerce website, I create an order using a fake credit card. Meanwhile, I’m capturing all the traffic with Burp.

It’s always tempting to switch between my web browser and Burp, but I find it distracting. Therefore, I do my best to focus on understanding the business features and making note of the interesting ones. For instance, I always look for file uploads, data export, rich text editors, etc.

### Understanding the main application architecture and defense mechanisms

This is where I revise my Burp traffic to answer specific questions. How authentication is made? Does the application use a third-party for that? Is there any OAuth flow? Is there any CSRF protection? If yes, how is it implemented? Are there any resources referenced using numerical identifiers? If yes, is there any protection against [IDOR vulnerabilities](https://thehackerish.com/idor-explained-owasp-top-10-vulnerabilities/)? Does the application use any API? How does the application fetch data? Does it use a front-end Framework? What JavaScript files contain calls to the API? Does it use a back-end Framework? If yes, what is it and which version is being used?

These are the kinds of questions I try to answer when I first interact with a web application. Having a clear idea of the architecture and the defense mechanisms help me make a better plan of attack. I might also find weaknesses right away, which are generally application-wide and have a high impact.

### JavaScript enumeration

Whenever I have the opportunity to read some code, I make sure to do so. Since JavaScript files power the client-side of the web application, I like to collect and analyze them. I found many hidden endpoints, Cross-site scripting and broken access control vulnerabilities this way. Using tools like [LinkFinder](https://github.com/GerbenJavado/LinkFinder), I collect URLs which I cross-reference with the endpoints I have collected from the mapping exercise. Sometimes, I do it the other way around. In other words, I look for API endpoints in JavaScript files using the naming convention of the endpoints I have in Burp. This allows me to save all the API endpoints into a file. It becomes handy when I want to implement some automation to detect when the developers add new endpoints to the application.

### Focusing on one feature at a time

This is where it starts to get really interesting! By now, I am comfortable navigating around and using the application normally, I understand most features. If you quit before this phase and jump to another asset or another totally different program, you will have lost all the time you have invested learning how the application works. In this step, I’m trying to focus on one feature at a time. My goal is to learn the flow in detail, tinker with every user input based on my assumptions. For instance, if the request seems to be fetching data from a database, I would try SQL injection. If the user input gets returned, I will try Cross-Site Scripting. It all depends on your experience, but a solid start would be the OWASP Top 10, which I already covered in much detail in a [hands-on training](https://thehackerish.com/owasp-top-10-the-ultimate-guide).

## Pros and cons of this bug bounty methodology

This bug bounty methodology is powerful in many ways. However, by no means this is the perfect one. It has its limitations as well.

### Pros of this bug bounty methodology

Here are the pros of this methodology.

- **Simple and minimal:** It is a simple approach which requires minimal tools to yield the best initial results.
- **Speed:** One of the best things I love when following this bug bounty methodology is the speed it provides. I can get a general view of the entire program in less than an hour. If the program is big, it takes just a few hours.
- **Low hanging bugs:** Using this approach, you can easily find low hanging fruits if the program is new. It doesn’t require a lot of digging and effort. And if the program is old, you can still get a general idea of the company’s cyber presence.

### Cons of this bug bounty methodology

These are the limitations of this approach.

- It doesn’t cover the road less traveled: Because I’m using well-known tools with the default options, without any great deal of deep digging, I don’t expect to stumble upon a hidden asset or a less traveled road. That’s ok for me at this stage because this is my first interaction with the program. Usually, you won’t find easy bugs with it.
- It doesn’t cover programs with IP ranges: If there is a program which has IP ranges in scope, this methodology wouldn’t work 100%. You need to still perform a port scan, which you can easily do with masscan.

## Conclusion

There you have it! An end-to-end bug bounty methodology that you can use when you interact with a program for the first time. Rather than spending a lot of time doing extensive recon upfront, I find it more efficient to first assess the program’s IT infrastructure while focusing on one or two web applications.

I’d love to hear your thoughts and opinions on this bug bounty methodology. If you have any ideas on how to improve it, I encourage you to leave a comment describing how to do it. If you follow a different methodology, I’d love to know how you approach your bug bounty programs.

I hope you found this episode helpful. If you did, then I’d appreciate you liking and sharing it. If you’re not subscribed yet, join us to get updates whenever I publish new content. You’ll find all the social links in the description. Until then, stay curious, keep learning and go find some bugs!


