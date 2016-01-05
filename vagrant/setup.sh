#!/bin/bash

#Alias for Apt-Get installs to stay DRY
install="sudo apt-get install -y"

# Add the apt-get repo for node 4.2.x (LTS) and install it
nodeVersion=`node --version`
if [[ $nodeVersion != v4.2* ]] ; then 
  curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
  sudo apt-get update
  $install nodejs
  # Get the latest version of NPM
  sudo npm update -g npm
fi

# Install Mongo (latest version)
mongoVersion="3.2.0"
if [[  `which mongo` == "" ]] ; then
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
  echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
  sudo apt-get update
  #$install --force-yes mongodb-org
  $install mongodb-org=$mongoVersion \
  mongodb-org-server=$mongoVersion \
  mongodb-org-shell=$mongoVersion \
  mongodb-org-mongos=$mongoVersion \
  mongodb-org-tools=$mongoVersion
fi

# Install Git
$install git
$install git-flow

# Install NPM Packages
npm install -g gulp

# Heat up the workspace
if [ ! -d "/projects/fg-service" ]; then
  cd /projects
  git clone https://github.com/featureguardian/fg-service.git develop
  cd /projects/fg-service
  git branch develop
  npm install
fi

if [ ! -d "/projects/fg-admin-ui" ]; then
  cd /projects
  git clone https://github.com/featureguardian/fg-admin-ui.git  
  cd /projects/fg-admin-ui
  git branch develop
  npm install
fi
