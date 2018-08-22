#!/usr/bin/env bash

DOCKER=`which docker`
#Stable docker version
STABDV="18.03.0~ce-0~ubuntu"
CHECK_VERSION="18.03.0-ce"
INSTALLED_DOCKER_VERSION=$($DOCKER -v | awk -F"," '{ print $1 }' | awk '{print $3}')



repo_setup(){
  sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common;
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -; 
    sudo apt-key fingerprint 0EBFCD88;
   sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
}

install_docker(){
    #sudo apt -y install docker-ce
    sudo apt update
    sudo apt -y install docker-ce="$STABDV"
}

start_docker(){
    sudo systemctl enable docker
    sudo systemctl start docker
    sleep 1
    sudo docker run hello-world
}

docker_install_check(){
 CHECK=$($DOCKER -v 2> /dev/null)
 #declare -a DOCKER_OLD=($CHECK)
 if [[ $CHECK && ($CHECK_VERSION != $INSTALLED_DOCKER_VERSION ) ]]
 then
   remove_docker
 elif [[ $CHECK_VERSION == $INSTALLED_DOCKER_VERSION ]]
 then

   echo -e "Installed docker version is same as $STABDV \e[31m $CHECK \e[0m "
 else
   echo "NO docker installed"
   repo_setup
   install_docker
   start_docker
 fi
}



docker_install_check
