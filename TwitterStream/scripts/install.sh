#!/bin/bash


# Install script to provision server

curUser=$(whoami)
if [[ $curUser=="vagrant" ]]
then
    # The next two lines set up vagrant to always log you in to the shared
    # directory so that your work is easily visible/accessible from the host.
    cd /vagrant
    echo "cd /vagrant" | sudo tee -a ~vagrant/.profile
else
    # If you are actually deploying this on a server somewhere, then here is
    # where you should set up the server directories
    echo "Not implemented"
fi

# OS
sudo apt-get update

# Tools
sudo apt-get -y install build-essential # g++, make, etc.
sudo apt-get -y install git curl

# Python
sudo apt-get -y install python3-setuptools
sudo apt-get -y install python3-dev
sudo apt-get -y install python3-pip

sudo pip3 install pymongo
sudo pip3 install tweepy

#numpy
sudo apt-get -y install gfortran
sudo apt-get -y install python3-nose
sudo apt-get -y install python3-numpy

#matplotlib
sudo apt-get -y install python3-matplotlib

#scipy
sudo apt-get -y install python3-scipy

#pandas
sudo apt-get -y install python3-pandas
