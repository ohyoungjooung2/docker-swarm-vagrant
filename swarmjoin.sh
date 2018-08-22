#!/usr/bin/env bash
LEAD="10.3.0.2"
LEADPORT="2377"
IPPORT="$LEAD:$LEADPORT"
NETS=$(which netstat)
if [[ ! $NETS ]]
then
  sudo apt -y install net-tools
else
 echo "netstat net-tools already installed"
fi


NETCHECK=$(sudo $NETS -tpln | grep 2377)
if [[ $NETCHECK ]]
then
  echo -e "\e[33m Seems like this node already joined \e[0m"
else
  echo -e "\e[36m Node will join with master $LEAD \e[0m"
  JOINS=$(ssh -o StrictHostKeyChecking=no -i /vagrant/id_rsa vagrant@10.3.0.2 'cat /vagrant/swarm_in.log | grep "2377"')
  echo -e "\e[36m $JOINS ! \e[0m"
  sudo $JOINS
fi
