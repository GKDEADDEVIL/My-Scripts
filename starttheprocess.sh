#!/bin/bash

mkdir ~/Documents/mytools ~/Documents/myscripts ~/Documents/mylabs ~/Documents/mytests


#: <<COMMENT
echo "# Some other aliases" >> .bashrc
echo "alias ls=ls -la --color=auto" >> .bashrc
echo "alias down='cd ~/Downloads'" >> .bashrc
echo "alias doc='cd ~/Documents'" >> .bashrc
echo "alias ..='cd ..'" >> .bashrc
echo "alias yep='sudo apt install \$1'" >> .bashrc
echo "alias nop='sudo apt remove \$1'" >> .bashrc
echo "alias whatsup='service --status-all'" >> .bashrc
echo "alias ports='nmap localhost'" >> .bashrc
echo "alias bye='shutdown -P'" >> .bashrc
echo "alias c='clear'" >> .bashrc
echo "alias h='history'" >> .bashrc
echo "alias hg='history | grep \$1'" >> .bashrc
echo "alias ld='ls -d */'" >> .bashrc
echo "alias j='jobs -l'" >> .bashrc
echo "alias root='sudo -i'" >> .bashrc
echo "alias su='sudo -i'" >> .bashrc
echo "alias tools='cd ~/Documents/mytools'" >> .bashrc
echo "alias labs='cd ~/Documents/mylabs'" >> .bashrc
echo "alias scripts='cd ~/Documents/myscripts'" >> .bashrc
echo "alias tests='cd ~/Documents/mytests" >> .bashrc
echo "alias nessus-start='sudo /bin/systemctl start nessusd.service'" >> .bashrc
echo "alias nessus-stop='sudo /bin/systemctl stop nessusd.service'" >> .bashrc
#alias s='fc -ln -1 | sed "s/^sudo //" | sudo sh'


#COMMENT

# Commenting auto suggestions

# Define the lines to be commented out
lines_to_comment=(
    "if \[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh \]; then"
    "    \. /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
    "    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'"
    "fi"
)
# Loop through each line and comment it out in .bashrc
for line in "${lines_to_comment[@]}"; do
    sed -i "s|^\($line\)|#\1|" .bashrc
done

