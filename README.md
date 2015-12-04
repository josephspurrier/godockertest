# Run Simple Golang Web Application through Docker on Ubuntu 14.04 via AWS

This is just a simple test of using build constraints to differentiate Golang builds on Windows and Linux using docker to test.
These are the steps to run the Golang web application.

## Setup the server
```
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get -y install linux-image-extra-$(uname -r)
sudo apt-get -y install docker-engine
sudo usermod -aG docker ubuntu
```

## Logout and then login to get access to Docker with having to use sudo
```
git clone https://github.com/josephspurrier/godockertest
docker build -t godockertest ./godockertest
docker run -i -t -p 80:80 godockertest
```

## Rebuild from latest GitHub
```
sudo rm -r godockertest
docker rm -v $(docker ps -a -q -f status=exited)
docker rmi $(docker images -f "dangling=true" -q)
git clone https://github.com/josephspurrier/godockertest
docker build -t godockertest ./godockertest
docker run -i -t -p 80:80 godockertest
```

You can now view the website through the public IP of the AWS EC2 instance.

## Other useful commands

```
# Start docker if it is not started
sudo service docker start

# Run the docker hello world application
sudo docker run hello-world

# List docker processes (running containers)
docker ps

# List docker images
docker images

# Remove all docker containers
docker rm `docker ps -aq`

# Remove all docker images
docker rmi `docker images -aq`

# Run container as a daemon
docker run -d -p 80:80 josephspurrier/godockertest

# Stop a container
docker stop {CONTAINER ID}

# Delete exited containers
docker rm -v $(docker ps -a -q -f status=exited)

# Delete dangling images
docker rmi $(docker images -f "dangling=true" -q)
```