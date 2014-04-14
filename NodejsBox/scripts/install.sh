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

# MySQL
mysqlTempPass="foo"
sudo DEBIAN_FRONTEND=noninteractive apt-get -q -y install mysql-server
mysqladmin -u root password $mysqlTempPass
sudo mysql -u root --password=$mysqlTempPass < ./scripts/mysql/schema.sql

#Node
NODEJS_VERSION=0.10
git clone git://github.com/creationix/nvm.git ~vagrant/.nvm
echo $'\n\n#nodejs nvm' | sudo tee -a ~vagrant/.profile
echo 'source ~vagrant/.nvm/nvm.sh' | sudo tee -a ~vagrant/.profile
source ~vagrant/.nvm/nvm.sh
nvm install $NODEJS_VERSION 
echo "nvm use $NODEJS_VERSION" | sudo tee -a ~vagrant/.profile
nvm use $NODEJS_MAJOR_VERSION


