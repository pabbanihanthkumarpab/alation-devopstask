#!/bin/bash


# Update vagrant user's bashrc file
echo "export TERM=xterm" >> /etc/bashrc

# Update hosts file
cat >>/etc/hosts<<EOF
172.42.42.100 webserver.example.com sampleapp
EOF

#install docker ce
apt-get update && apt-get install -y apt-transport-https curl
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get -y update
apt-get install -y docker-ce=18.06.3~ce~3-0~ubuntu
sudo usermod -aG docker vagrant

echo "Pulling necessary docker images"

docker pull nginx
docker pull node:7
