#!/bin/bash
#add fix to exercise5-server1 here


sudo -u vagrant ssh-keygen -t rsa -N "" -f /home/vagrant/.ssh/id_rsa
cp /home/vagrant/.ssh/id_rsa.pub /vagrant/id_rsa.pub
cp /home/vagrant/.ssh/id_rsa /vagrant/id_rsa
