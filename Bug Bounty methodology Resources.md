
[[little thing]]
[[little thing 2]]
[[Skills can make you a top notch Web Hacker]]
[[Bug Bounty Methodology Web Vulnerabilities Checklist]]
[[My Cheatsheets and tools list]]
[[API testing]]
[[useful links]]

![[Pasted image 20240125140141.png]]

Scope
Shodan
ASN Analysis (why do we need this ASN)
Crunchbase++
ReconGTP
Reverse WHOIS
Certificate Analysis
Add and analytics relationships
supply chain investigation and SaaS
Google fu
TLDs Scanning
Apex domains

Bug bounty methodology - 1
- Analyzing the scope of the program
- Looking for valid targets
- High-level testing of discovered targets
- Reviewing all applications
- Fuzzing for errors to expose flaws
- Exploiting vulnerabilities to generate POCs

1. Analyzing the scope of the program: The scope guidelines have been clearly discussed in the previous chapters. This is the basic task that has to be done. The scope is the most important aspect of a bug bounty program because it tells you which assets to test and you don't want to spend time testing out-of-scope domains. The scope also tells you which are the most recent targets and which are the ones that can be tested to speed up your bounty process.

2. Looking for valid targets: Sometimes the program does not necessarily have the entire infrastructure in its scope and there are just a number of apps or domains that are in the scope of the program. Valid targets are targets that help you quickly test for vulnerabilities in the scope and reduce time wasting

3. High-level testing of discovered targets: The next thing to do is a quick overview of targets. This is usually done via automated scanning. This basically tells the researchers whether the targets have been tested before or have they been tested a long time ago. If automated scanning does not reveal vulnerabilities or flaws within a web application or a mobile application, it is likely that the application has been tested by researchers before. Nonetheless, it is still advised to test that application one way or another, as this reveals the application's flaws in detail.

4. Reviewing all applications: This is a stage where you review all the applications and select the ones based on your skill set. For instance, Google has a number of applications; some of them are coded in Ruby on Rails, some of them are coded in Python. Doing a brief recon on each application of Google will reveal which application is worth testing based on your skill set and level of experience. The method of reviewing all the applications is mostly information gathering and reconnaissance.

5. Fuzzing for errors to expose flaws: Fuzzing is termed as iteration; the fastest way to hack an application is to test all of its input parameters. Fuzzing takes place at the input parameters and is a method of iterating different payloads at different parameters to observe responses. When testing for SQL injection vulnerabilities and cross-site scripting vulnerabilities, fuzzing is the most powerful method to learn about errors and exposure of flaws. It is also used to map an application's backend structure.

6. Exploiting vulnerabilities to generate POCs: By fuzzing, we identify the vulnerabilities. In other scenarios, vulnerability identification is just one aspect of it. In bug bounty hunting, vulnerabilities have to be exploited constructively to generate strong proof of concepts so that the report is considered in high regard. A well explained the proof of concepts will accelerate the review process. In conventional penetration tests, vulnerability exploitation is not that important, but in bug bounty hunting, the stronger the proof of concept, the better the reward.

IMP:
	1. when testing for SQL injection vulnerabilities and cross site scripting vulnerabilities, fuzzing is the most powerful method to learn about errors and exposure of flaws. 
	2. Fuzzing is also used to map an application's backend structure. 
	3. Vulnerability identification is just one aspect of it. In bug bounty, vulnerabilities have to be exploited constructively to generate strong proof of concept so that the report is considered in high regard. 
Learning about web application technologies, mobile application technologies. 




EDIT: The main point is you can hack with Kali Linux, but only if you know what you’re doing.

The equation `I can use Kali Linux = I’m a hacker` is definitely wrong, though.

For you to be a hacker, it takes more than that.

As for how to do it, google Kali Unleashed and check YouTube, you’ll find thousands of free materials about it.

_______________________________________________________________________

No offense, but the tone of your question makes me think you got no clue what you’re talking about, nor what you’re getting yourself into.

Someone told you Kali Linux is the hackers’ tool and, if you learn how to use it, you’ll be a hacker.

The goshdarn Hacking Holy Grail.

Hell, yeah!

Sure, they can give you a sheet of paper with “Ethical Hacker” on it, but you can pretty much use it as a toilet paper, for what it counts.

I got news for ya.

If you dare going around talking like that trying to get a job in the cyber security industry (by the way, talk about InfoSec and use “cyber” very sparingly in a professional context), be willing to get mocked and laughed at.

No operating system makes you a hacker, nor it can.

Knowledge, skills and attitude make you a hacker.

In most cases, it’s an inborn type of mindset and I agree with Kim Guldberg on this.

Hacking is not easy at all, darn it, and I repeat it for good, in case you guys didn’t listen to me hard enough so far.

It’s fuck*ng hard and frustrating and boring and makes you feel like sh*@*t because you don’t know if what you’re doing works, if it’s gonna ever work, nor what you’re doing wrong.

You’re on your own; either you learn by yourself and fast, or you sink miserably.

Things change fast in cyber security and you need to keep up.

I had your same naive attitude, then I realized I couldn’t get a damn thing out of those tools, so I went back to the drawing board.

I learned Linux, Python, PHP, still studying C/C++, Assembly, Ruby and I still feeling I’m going nowhere, I don’t know enough and I’m not smart enough for me to be a hacker, if I’m gonna ever be one.

I don’t know what the hell I am anymore, by now. I guess I’m on a highway to hell (LOL).

I can’t stop learning but I don’t know where it’s leading me.

So, yes, Kali, is free of charge but knowledge is only apparently free.

It costs you your life, your darn time sitting on a computer trying to get answers.

Notice I said get answers, not ask for answers. I try to find the answers myself first.

No one hands you over the answer, nor it’s fair for anyone to do so.

The search path you go through is much more important than the answer itself.

Then cyber security pros are frickin’ busy and they don’t have time to waste, unless you do something that adds value or solves a problem.

For example, I gave my company a script for them to automate certain searches.

That GOT THEIR ATTENTION.

Even if they thought my code was crap, I had done it myself and in my downtime.

Think you got a clearer picture now.