#!/bin/bash

sudo rm -r godockertest
docker rm -v $(docker ps -a -q -f status=exited)
docker rmi $(docker images -f "dangling=true" -q)
git clone https://github.com/josephspurrier/godockertest
docker build -t godockertest ./godockertest
docker run -i -t -p 80:80 godockertest