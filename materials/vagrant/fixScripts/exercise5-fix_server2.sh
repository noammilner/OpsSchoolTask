#!/bin/bash
#add fix to exercise5-server2 here

sudo apt-get update && sudo apt-get install -y sshpass
cat /vagrant/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
sudo sed -i '/#PasswordAuthentication yes/c\PasswordAuthentication no' /etc/ssh/sshd_config
sudo service ssh restart

