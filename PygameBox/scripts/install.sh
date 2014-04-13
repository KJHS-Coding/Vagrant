#!/bin/bash


# Work in the shared directory
cd /vagrant
echo "cd /vagrant" | sudo tee -a ~vagrant/.profile else

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


