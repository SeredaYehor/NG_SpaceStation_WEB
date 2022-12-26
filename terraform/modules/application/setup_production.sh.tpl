#!/bin/bash

useradd -m builder
passwd -d builder
mkdir -p /home/builder/.ssh
usermod --shell /bin/bash builder
echo ${public_key} > /home/builder/.ssh/authorized_keys
chmod 600 /home/builder/.ssh/authorized_keys
chown -R builder:builder /home/builder
echo "builder ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/builder

wget http://get.docker.com -O install_docker
chmod +x install_docker
./install_docker
