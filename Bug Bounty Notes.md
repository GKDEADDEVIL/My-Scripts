

## Recon

Find all subdomains, even ones that aren't active.
Always scan all ports

Tools to get set up:
	MassDns for brute forcing subdomains
	Intregue. Io for recon

To Do - Custom Scrips:

1. Build Python script that checks searches GitHub and returns a list of searches with at least 1 result - DONE!


### Recon Methodology:

1. Gather information about the target, including Acquisitions
	- www.crunchbase.com (Find Acquisitions)

2. Identify ASNs
	-Manual: http://bgp.he.net
	- Automated:
		-Metabigor
		-ASNLookup
		-amass intel -asn [ASN NUMBER]

3. Find seeds/root domains
	-Reverse WHOIS (Automation - DOMLink)
	-Ad/Analytics Relationships (builtwith. Com -> Relationships)
	-Google Dorks
	-Shodan

4. Find subdomains (**MY FRAMEWORK BEGINS HERE**)

	a. Linked and JS Discovery (finding all links included in the client-side code of an application)
		
		-W/ Burp Suite Pro:
			1. Turn off passive scanning


To Do:
Cron Job - 6 hrs - kindling. Py - Done!
Cron Job - 24 hrs - fire_starter. Py - Done!
Cron Job - 1 wk - firewood. Py - Done!


1. Additional Ports on kindling. Py (httprobe) - Done!
2. Valuable data on Dashboard - Done!
2. Cloud Ranges Module - Done!
3. Custom Wordlist Module - Done!
4. Application / Server Info Modules
5. Fix Subdomainizer module


		
	b. Subdomain Scraping (scrape domain information from various sources to identify URLs or domains stored in their database)
		-Infrastructure Sources (Censys, DnsDumpster, WaybackMachine)
		-Certificate Sources (crt. Sh, CertDB, Cert Spotter)
		-Search Sources (Google, Yahoo, Baidu)
		-Security Sources (Virus Total, Rapid 7 Project Sonar, SecurityTrails)

		-Tools - Amass and Subfinder
		(Amass returns ASN numbers.  If these are new, go back to step 2 and start over)
		-github-search -> github-subdomains.py (run 5 times, 4 w/ 6 second sleep and 1 w/ 10 second sleep)
		-shosubgo (Shodan parser)
		-Cloud Ranges - A highly valuable technique is to monitor whole could ranges of AWS, GCP, and Azure for SSL sites and parse their certificates to match your target (Check port 443) (Article by Daehee Park, Defcon Talk by Sam Erb - tls.bufferover.run/dns?q=[SEARCH_TERM])
		
	c. Subdomain Bruteforcing (brute force to find live subdomains)
		-amass enum -brute -d [DOMAIN] -rf
		-shuffleDNS (wrapper around massDNS)
		-Wordlists:
			a. Tailored Wordlists
				-TomNomNom
				-Cewl
			b. Massive Wordlists
				-all. Txt (JHaddix)
		- https://github.com/assetnote/commonspeak2
		-Subdomain Alterations ( www.target.com -> ww 2. Target. Com)

5. Port Analysis

	-masscan (Quick tool to identify open ports) (needs IP list!) ( https://danielmiessler.com/study/masscan/ )
	-dnmasscan (Wrapper that resolves domain name and passes the IP to masscan)
	-nmap (Deep dive on open ports discovered)
	-Brutespray (Checks for default creds)

6. Github Dorking (While subdomain automation is running)

-Find endpoints and subdomains
-Make custom wordlists for each target based on technologies discovered 
-Most orgs use similar directory structures on their sites.  If a disabled subdomain is found on GitHub, build wordlists using these directories
-Naming conventions and patterns are very important!
-Use job postings to identify technology stack
-After searching, check "Languages for scripting languages"
	-search by langauge (EX: language: python language:bash)
-Check for recently submitted repos
-Make sure the repo is related to their company
-Remove unnecessary results with NOT keyword (EX: "teslamotors" NOT owner-api. Teslamotors. Com)
-Identify users that work at the organization but are not listed under the Org's main repo (look for them on Linkedin to comfirm)
-Find users that work for org but aren't listed with these searches:
	-"[ORG]" dotfiles
-For manual, finding users who are not mapped to the organization is most important!

7. Httprobe -> Eyewitness
		
8. Subdomain Takeover
	-EdOverflow/can-i-take-over-xyz (Database of Definitions for SDT)
	-SubOver 
	-nuclei