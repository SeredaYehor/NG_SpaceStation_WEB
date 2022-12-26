#!/bin/bash

wget http://get.docker.com -O install_docker
chmod +x install_docker
./install_docker
address=`ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1`
docker run -d --name teamcity-server-instance -p 8111:8111 jetbrains/teamcity-server
docker run -d --name agent -e SERVER_URL="${address}:8111" -u 0 -v docker_volumes:/var/lib/docker \
   --privileged -e DOCKER_IN_DOCKER=start jetbrains/teamcity-agent:2022.10-linux-sudo

docker exec agent apt update -y
docker exec agent apt install zip -y
#docker exec agent add-apt-repository -y ppa:deadsnakes/ppa
#docker exec agent apt install -y python3.10 python3-pip
#docker exec agent bash -c 'curl -sS https://bootstrap.pypa.io/get-pip.py | python3.10'
#docker exec agent apt install -y python3.10-distutils
