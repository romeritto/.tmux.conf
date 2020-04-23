#!/usr/bin/env bash

# Define colors.
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Print all commands.
# set -o xtrace

sudo apt -y update
sudo apt -y upgrade


# Setup tmux.
echo -e "${GREEN}Do you want to setup tmux?${NC}"
select yn in "Yes" "No"; do
    case $yn in
        Yes)
          sudo apt install -y tmux;
          wget https://raw.githubusercontent.com/sobkulir/setup/master/.tmux.conf \
               -O ~/.tmux.conf;
          break;;
        No) break;;
    esac
done

# Setup vim
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

