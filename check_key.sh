#!/usr/bin/env bash
DOCKER_USER="vagrant"
KEY=$(cat /vagrant/pub_key)
VMKEY=$(cat /home/vagrant/.ssh/authorized_keys | tail -1)
if [[ $KEY != $VMKEY ]]
then
 echo $KEY >> /home/vagrant/.ssh/authorized_keys
else
 echo -e "\e [33m $KEY ALREADY INSTALLED \e[0m "
fi 
sudo apt -y install telnet net-tools wget git
 echo -e "\e [33m $USER is docker's root! \e[0m "
 sudo groupadd docker
 sudo usermod -aG docker $DOCKER_USER
