# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

   config.vm.define "swarmlead" do |swarmlead|
   swarmlead.vm.box = "yk0/ubuntu-xenial"
   swarmlead.vm.provision "shell", path: "check_key.sh"
   swarmlead.vm.provision "shell", :path => "uidocinst.sh"
   swarmlead.vm.provision "shell", :path => "swarm_init.sh"
   swarmlead.vm.network "private_network", ip:"10.3.0.2"
   swarmlead.vm.host_name = "swarmlead"
     swarmlead.vm.provider :libvirt do |lv|
      #Virtualbox
      #vb.customize ["modifyvm", :id, "--memory", "2048"]
      #vb.customize ["modifyvm", :id, "--cpus", "2"]

      #Libvirt
      lv.cpus = 1
      lv.memory = 1024
     end
   end

   config.vm.define "swarmworker1" do |swarmworker1|
   swarmworker1.vm.box = "yk0/ubuntu-xenial"
   swarmworker1.vm.provision "shell", path: "check_key.sh"
   #$swarmworker1.vm.provision "shell", :path => "swapoff.sh"
   #swarmworker1.vm.provision "shell", :path => "swarm_docker_install.sh"
   swarmworker1.vm.provision "shell", :path => "uidocinst.sh"
   swarmworker1.vm.provision "shell", :path => "swarmjoin.sh"
   swarmworker1.vm.network "private_network", ip:"10.3.0.3"
   swarmworker1.vm.host_name = "swarmworker1"
     swarmworker1.vm.provider :libvirt do |vb|
      vb.memory = 1024
     end
   end

   
   config.vm.define "swarmworker2" do |swarmworker2|
   swarmworker2.vm.box = "yk0/ubuntu-xenial"
   #swarmworker2.vm.provision "shell", inline: "cat /vagrant/pub_key >> /home/vagrant/.ssh/authorized_keys"
   swarmworker2.vm.provision "shell", path: "check_key.sh"
   #swarmworker2.vm.provision "shell", :path => "swapoff.sh"
   #swarmworker2.vm.provision "shell", :path => "swarm_docker_install.sh"
   swarmworker2.vm.provision "shell", :path => "uidocinst.sh"
   swarmworker2.vm.provision "shell", :path => "swarmjoin.sh"
   swarmworker2.vm.network "private_network", ip:"10.3.0.4"
   swarmworker2.vm.host_name = "swarmworker2"
     swarmworker2.vm.provider :libvirt do |vb|
      vb.memory = 1024
     end
   end

 
#   config.vm.define "swarmnfs" do |swarmnfs|
#   swarmnfs.vm.box = "yk0/ubuntu-xenial"
#   #swarmnfs.vm.provision "shell", inline: "cat /vagrant/pub_key >> /home/vagrant/.ssh/authorized_keys"
#   swarmnfs.vm.provision "shell", path: "check_key.sh"
#   #swarmnfs.vm.provision "shell", :path => "swapoff.sh"
#   #swarmnfs.vm.provision "shell", :path => "swarm_docker_install.sh"
#   #swarmnfs.vm.provision "shell", :path => "uidocinst.sh"
#   #swarmnfs.vm.provision "shell", :path => "admjoin.sh"
#   swarmnfs.vm.network "private_network", ip:"10.3.0.6"
#   swarmnfs.vm.host_name = "swarmnfs"
#     swarmnfs.vm.provider :libvirt do |vb|
#      vb.memory = 512
#      vb.storage :file, :size => '10G'
#      #libvirt.storage :file, :size => '20G'
#     end
#   end

   config.vm.define "swarmworker3" do |swarmworker3|
   swarmworker3.vm.box = "yk0/ubuntu-xenial"
   swarmworker3.vm.provision "shell", path: "check_key.sh"
   #swarmworker3.vm.provision "shell", :path => "swapoff.sh"
   swarmworker3.vm.provision "shell", :path => "uidocinst.sh"
   swarmworker3.vm.provision "shell", :path => "swarmjoin.sh"
   swarmworker3.vm.network "private_network", ip:"10.3.0.5"
   swarmworker3.vm.host_name = "swarmworker3"
     swarmworker3.vm.provider :libvirt do |vb|
      vb.memory = 1024
     end
   end
end
