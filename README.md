# Run Simple Golang Web Application through Docker on Ubuntu 14.04 via AWS

This is just a simple test of using build constraints to differentiate Golang builds on Windows and Linux using docker to test.
These are the steps to run the Golang web application.

## Download the repository and update the server
```
git clone https://github.com/josephspurrier/godockertest
sh ./godockertest/scripts/setup.sh
```

## Logout and then back in so Docker can be run without root

## Clean and build the app (rerun this command to rebuild each time)
```
sh ./godockertest/scripts/build.sh
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