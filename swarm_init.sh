#!/usr/bin/env bash
#Nettools install
sudo apt -y install net-tools

VHOME="/home/vagrant"
KUSER="vagrant"
check_ok(){
  if [[ $? == "0" ]]
  then
     echo -e "\e[36m $1 job successful \e[0m"
  else
     echo -e "\e[33m $1 job failed \e[0m"
     exit 1
  fi
}

swarm_init(){
API_CHECK=$(netstat -tpln | grep kube-api)
if [[ ! $API_CHECK ]]
then
  echo -e "\e[36m docker swarm init apiserver advertise   \e[0m"
  sudo docker swarm init --advertise-addr=10.3.0.2 > /vagrant/swarm_init.log
  sudo chown vagrant:vagrant /vagrant/swarm_init.log
  sudo cp /vagrant/swarm_init.log /vagrant/swarm_in.log
  check_ok swarm_init
else
  echo -e "\e[33m kubeadm init apiserver already running  \e[0m"
fi
}



swarm_init
