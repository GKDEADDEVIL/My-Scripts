import os
import subprocess
import argparse

def run_command(command):
    result = subprocess.run(command, shell=True, stdout=subprocess.PIPE)
    return result.stdout.decode('utf-8')

def main(domain):
    if not os.path.exists(f'recon/{domain}'):
        os.makedirs(f'recon/{domain}')
    
    # ASN Numbers
    print("[*] Gathering ASN numbers...")
    asn_result = run_command(f'whois -h whois.cymru.com " -v {domain}"')
    with open(f'recon/{domain}/asn.txt', 'w') as f:
        f.write(asn_result)
    
    # IP Addresses and Subnets
    print("[*] Gathering IP addresses and subnets...")
    ips_result = run_command(f'dig {domain} +short')
    with open(f'recon/{domain}/ips.txt', 'w') as f:
        f.write(ips_result)
    subnets_result = run_command(f'whois $(dig {domain} +short) | grep -E "NetRange|CIDR|inetnum"')
    with open(f'recon/{domain}/subnets.txt', 'w') as f:
        f.write(subnets_result)
    
    # Subdomains
    print("[*] Gathering subdomains...")
    subfinder_result = run_command(f'subfinder -d {domain}')
    with open(f'recon/{domain}/subfinder_subs.txt', 'w') as f:
        f.write(subfinder_result)
    amass_result = run_command(f'amass enum -d {domain}')
    with open(f'recon/{domain}/amass_subs.txt', 'w') as f:
        f.write(amass_result)
    subdomains = set(subfinder_result.splitlines() + amass_result.splitlines())
    with open(f'recon/{domain}/subdomains.txt', 'w') as f:
        f.write("\n".join(subdomains))
    
    # Directories
    print("[*] Discovering directories...")
    run_command(f'python3 dirsearch/dirsearch.py -u {domain} -e * -o recon/{domain}/directories.txt')
    
    # Google Dorks
    print("[*] Performing Google Dorks...")
    google_dorks = [
        f'site:{domain}',
        f'site:{domain} inurl:admin',
        f'site:{domain} filetype:pdf'
    ]
    with open(f'recon/{domain}/google_dorks.txt', 'w') as f:
        for dork in google_dorks:
            googler_result = run_command(f'googler "{dork}" -n 50')
            f.write(googler_result + "\n\n")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Recon Script for Bug Bounty")
    parser.add_argument("domain", help="Domain to perform recon on")
    args = parser.parse_args()
    main(args.domain)
