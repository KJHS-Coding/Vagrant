#!/bin/bash


# Work in the shared directory
cd /vagrant
echo "cd /vagrant" | sudo tee -a ~vagrant/.profile 

# OS
sudo apt-get update

# Tools
sudo apt-get -y install build-essential # g++, make, etc.
sudo apt-get -y install git curl
sudo apt-get -y install x11-apps

sudo usermod -aG audio vagrant # to use audio

# PyGame
sudo apt-get -y install alsa-utils
sudo apt-get -y install python-pygame

# Example Game https://github.com/metulburr/pong.git
# The game is a good, simple pong example, but has some
# large .exe files - hence the git sparse-checkout
mkdir pong
cd pong
git init
git remote add -f origin https://github.com/metulburr/pong.git
git config core.sparsecheckout true
touch .git/info/sparse-checkout
echo "/*" | tee -a .git/info/sparse-checkout
echo "!*.exe" | tee -a .git/info/sparse-checkout
git pull origin master


