#!/bin/bash

SERVICE="CyberOmin Blog"


echo "Provisioning Development Environment for: $SERVICE"

echo "Updating environment"
sudo apt-get update -y
sudo apt-get upgrade -y

echo "Installing Ruby and"
sudo apt-get install ruby ruby-dev make gcc nodejs -y

echo "Installing Jekyll"
sudo gem install jekyll --no-rdoc --no-ri