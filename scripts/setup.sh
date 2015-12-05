#!/bin/bash

sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get -y install linux-image-extra-$(uname -r)
sudo apt-get -y install docker-engine
sudo usermod -aG docker ubuntu
echo "Server ready with Docker. Please logout and then back in."