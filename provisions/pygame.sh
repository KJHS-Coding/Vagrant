#!/bin/bash


# This script will install pygame on a vagrant box

# Audio Permissions
sudo usermod -aG audio vagrant

sudo apt-get -y install python-pygame


