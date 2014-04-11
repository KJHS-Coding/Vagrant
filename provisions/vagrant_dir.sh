#!/bin/bash

# This script checks to see if it is running on the virtual machine
# and then makes '/vagrant' the default working directory.  This makes
# file sharing between the host and guest exteremely simple.

curUser=$(whoami)

if [[ $curUser=="vagrant" ]]
then
    cd /vagrant
    echo "cd /vagrant" | sudo tee -a ~vagrant/.profile
fi
