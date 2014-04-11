#!/bin/bash

# dependencies
sudo apt-get -y install openssl libssl-dev pkg-config

# download bleeding-edge GitHub repo
git clone https://github.com/joyent/node.git
cd node/

# install source code 
./configure
make
sudo make install

# clean up
cd ..
rm -rf node


