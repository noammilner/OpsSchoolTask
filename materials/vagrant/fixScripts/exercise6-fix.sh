#!/bin/bash
#add fix to exercise6-fix here

cp /vagrant/id_rsa /home/vagrant/
sudo chmod 600 /home/vagrant/id_rsa
cat /vagrant/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
dest=${!#}
arguments=("${@:1:$#-1}")
host=$(hostname)
remote_host="server2"

if [ "$host" == "server2" ]; then
    remote_host="server1"
fi

key="/home/vagrant/id_rsa" 
total_bytes_copied=0

for file in "${arguments[@]}"; do
    scp -i "$key" "$file" "${remote_host}:${dest}"
    if [ $? -eq 0 ]; then

        bytes_copied=$(stat -c %s "$file")

        total_bytes_copied=$((total_bytes_copied + bytes_copied))

    fi
done

echo "$total_bytes_copied"


