#!/usr/bin/env bash

# Define colors.
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Print all commands.
# set -o xtrace

sudo apt -y update
sudo apt -y upgrade

# Git
echo -e "${GREEN}Installing git${NC}"
sudo apt install -y git

# Tmux
echo -e "${GREEN}Do you want to setup tmux?${NC}"
select yn in "Yes" "No"; do
    case $yn in
        Yes)
          # The config is downloaded first in order to be used straight away after installation.
          # I'm actually not sure if it's needed.
          wget https://raw.githubusercontent.com/sobkulir/setup/master/.tmux.conf \
               -O ~/.tmux.conf;
          sudo apt install -y tmux;
          break;;
        No) break;;
    esac
done

# Vim
echo -e "${GREEN}Do you want to setup vim?${NC}"
select yn in "Yes" "No"; do
    case $yn in
        Yes)
          sudo apt install -y vim;
          wget https://raw.githubusercontent.com/sobkulir/setup/master/.vimrc \
               -O ~/.vimrc;
          break;;
        No) break;;
    esac
done

# Docker
echo -e "${GREEN}Do you want to setup Docker?${NC}"
select yn in "Yes" "No"; do
    case $yn in
        Yes)
          wget https://get.docker.com -O /tmp/get-docker.sh
          sudo sh /tmp/get-docker.sh
          ORIG_USER="$USER"
          sudo usermod -aG docker "$ORIG_USER"

          # Docker-compose
          sudo wget "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -O /usr/local/bin/docker-compose
          sudo chmod +x /usr/local/bin/docker-compose
          break;;
        No) break;;
    esac
done

# ZSH
echo -e "${GREEN}Do you want to setup ZSH?${NC}"
select yn in "Yes" "No"; do
    case $yn in
        Yes)
          sudo apt install -y zsh
          # ohmyzsh
          sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
          wget https://raw.githubusercontent.com/sobkulir/setup/master/.zshrc \
            -O ~/.zshrc;

          # autosuggestions, syntax-highliting
          git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
          git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

          # for the agnoster theme
          sudo apt install -y fonts-powerline
          wget https://raw.githubusercontent.com/sobkulir/setup/master/agnoster.zsh-theme \
            -O ~/.oh-my-zsh/themes/agnoster.zsh-theme;
          # In terminal profile pick Solarized (manually for now)
          # change background color to: #18171F 
          # change bottom left color to: #6A6A68
          # change terminal opacity to: none
          break;;
        No) break;;
    esac
done
