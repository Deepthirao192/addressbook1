#!/bin/bash

sudo yum install -y java-23-openjdk-devel
sudo yum install -y git
sudo yum install -y maven


if [ -d "addressbook" ]
then
echo "repo is cloned and repo is exits"
cd /home/ec2-user/addressboook
git pull origin master
else
git clone https://github.com/Deepthirao192/addressbook1.git
fi
cd /home/ec2-user/addressboook
mvn package