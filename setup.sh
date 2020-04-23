#!/usr/bin/env bash

# Define colors.
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Print all commands.
# set -o xtrace

sudo apt -y update
sudo apt -y upgrade


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


