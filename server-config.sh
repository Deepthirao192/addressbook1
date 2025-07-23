#!/bin/bash
set -e

echo "Installing Java 17 via Amazon Corretto..."

# Add Corretto 17 repo and install
sudo rpm --import https://yum.corretto.aws/corretto.key
sudo curl -L -o /etc/yum.repos.d/corretto.repo https://yum.corretto.aws/corretto.repo
sudo dnf install -y java-17-amazon-corretto-devel

# Verify installation
java -version

echo "Installing Git and Maven..."
sudo dnf install -y git maven

# Clone or update the repo
if [ -d "/home/ec2-user/addressbook1" ]; then
    echo "Repo exists. Pulling latest changes..."
    cd /home/ec2-user/addressbook1
    git pull origin master
else
    echo "Cloning repo..."
    git clone https://github.com/Deepthirao192/addressbook1.git /home/ec2-user/addressbook1
    cd /home/ec2-user/addressbook1
fi

echo "Packaging the project..."
mvn clean package
