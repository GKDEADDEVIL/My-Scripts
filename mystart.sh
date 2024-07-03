#sudo apt update && sudo apt full-upgrade -y
#mkdir ~/Documents/myscripts ~/Documents/mylabs ~/Documents/mytools ~/Documents/wordlists


echo "alias down='cd ~/Downloads'
alias doc='cd ~/Documents'
alias ..='cd ..'
alias yep='sudo apt install $1'
alias nop='sudo apt remove $1'
alias whatsup='service --status-all'
alias ports='nmap localhost'
alias bye='shutdown -P'
alias c='clear'
alias h='history'
alias hg='history | grep $1'
alias ld='ls -d */'
alias j='jobs -l'
alias root='sudo -i'
alias su='sudo -i'
alias tools='cd /home/rabbit/Documents/mytools'
alias labs='cd ~/Documents/mylabs'
alias scripts='cd ~/Documents/myscripts'
alias licensekey='java -jar ~/Documents/mytools/Burp-Suite/keygen.jar'
alias nessus-start='sudo /bin/systemctl start nessusd.service'
alias nessus-stop='sudo /bin/systemctl stop nessusd.service'" >> ~/.zshrc

GREEN='\033[0;32m'
NC='\033[0m'

echo "${GREEN}[*] Installing Essentials${NC}"

sudo apt install beef ufw gedit git tor tmux sublime-text wireshark maltego metasploit-framework burpsuite wireshark aircrack-ng hydra nmap beef-xss nikto nodejs wget gpg amass feroxbuster dirb dirsearch wfuzz ffuf assetfinder httprobe wpscan seclists

sudo apt update

git clone https://github.com/TheRook/subbrute.git ~/Documents/mytools

git clone https://github.com/aboul3la/Sublist3r.git ~/Documents/mytools
pip install -r ~/Documents/mytools/Sublist3r/requirements.txt

git clone https://github.com/guelfoweb/knock.git ~/Documents/mytools
pip install -r ~/Documents/mytools/knock/requirements.txt
python3 ~/Documents/mytools/knock/setup.py install

git clone https://github.com/1N3/BruteX.git ~/Documents/mytools/BruteX

cd ~/Documents/mytools/BruteX
sudo ./install.sh

cd ~

go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest

#git clone https://github.com/six2dez/OneListForAll.git ~/Documents/wordlists


echo "${GREEN}[*] Installation Complete! ${NC}"
