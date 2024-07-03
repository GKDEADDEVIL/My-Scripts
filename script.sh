#!/bin/bash
GREEN='\033[1;32m'
BLUE='\033[1;34m'
NC='\033[0m'
GREEN_BOLD='\033[1;32m'
BLUE_BOLD='\033[1;34m'
NC='\033[0m'
echo -e "${GREEN}### Summary ###${NC}"
echo -e "${BLUE}Installed Languages and Tools:${NC}"
echo "- Python3"
echo "- Ruby"
echo "- Node.js and npm"
echo "- Git, Curl, Wget"
echo "- Golang"
echo "- sublist3r, dirb, feroxbuster, ffuf"
echo "- tmux, gedit, recon-ng, assetfinder"
echo "- Vim, beef, amass, konsole, gnome-terminal"
echo "- httprobe, wfuzz, wifite, htop, etherape"
echo "- Seclists"
echo "- Sublime Text"

echo ""
echo -e "${BLUE}Settings Changed:${NC}"
echo "- Auto suggestions in .bashrc commented out"
echo "- Custom functions added to .bashrc_profile"

echo ""
echo -e "${GREEN}Setup complete.${NC}"
