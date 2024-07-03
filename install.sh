sudo apt-get -y update
sudo apt-get -y upgrade

if [ -f setup.sh ]; then
    chmod +x setup.sh
    ./setup.sh
else
    echo "setup.sh not found, skipping Basic Setup."
fi

sudo apt install -y git python3 pip pip3 ruby-full gem golang-go
cd
go mod init example/hello
sudo apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
sudo apt-get install -y build-essential libssl-dev libffi-dev python-dev
sudo apt-get install -y python-setuptools
sudo apt install -y nmap wireshark burp openssh-server 


echo "##### Installing the Git tools #####"

git clone https://github.com/aboul3la/Sublist3r.git ~/Documents/mytools
cd ~/Documents/mytools/Sublist3r
pip install -r requirements.txt


git clone https://github.com/maurosoria/dirsearch.git ~/Documents/mytools

git clone https://github.com/guelfoweb/knock.git ~/Documents/mytools

git clone https://github.com/blechschmidt/massdns.git ~/Documents/mytools
cd ~/Documents/mytools/massdns
make

git clone https://github.com/yassineaboukir/asnlookup.git ~/Documents/mytools

cd ~/Documents/mytools/asnlookup
pip install -r requirements.txt

go install github.com/tomnomnom/httprobe@latest


