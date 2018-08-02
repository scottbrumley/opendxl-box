#!/usr/bin/env bash

## Install Python3
ln -s /usr/bin/python3 /usr/local/bin/python
sudo apt-get install python3-setuptools
sudo easy_install3 pip

## Install OpenDXL Client
git clone https://github.com/opendxl/opendxl-client-python.git
cd opendxl-client-python
sudo python setup.py install
cd ~

## Install OpenDXL Bootstrap
git clone https://github.com/opendxl/opendxl-bootstrap-python.git
cd opendxl-bootstrap-python
sudo python setup.py install
cd ~

## Install Docker
sudo apt-get remove docker docker-engine docker.io
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install -y docker-ce

## Run the OpenDXL Broker
sudo docker run -p 8883:8883 -p 8443:8443 --restart unless-stopped --name broker -d -it opendxl/opendxl-broker

cd /vagrant

## Fix SSH keys
# chmod 0700 /home/vagrant/.ssh
# chmod 0600 /home/vagrant/.ssh/authorized_keys
# chown -R vagrant /home/vagrant/.ssh