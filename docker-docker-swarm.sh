#1.access dropets
ssh your_username@your_droplet_ip
#1.Update System Packages
sudo apt update
sudo apt upgrade
#2.Install Docker
#Install Docker using the official Docker repository
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt-get install docker-ce
docker --version
#3.Start and Enable Docker Service
#Start the Docker service and enable it to start on boot
sudo systemctl start docker
sudo systemctl enable docker
#4.Install Docker Swarm (Optional)
#Run the following command on your terminal:
# run bellow command base on ip found
docker swarm init --advertise-addr <DROPLET_IP>
#5.Join Additional Nodes to the Swarm (Optional):
docker swarm join --token <TOKEN> <DROPTLET_IP>:<PORT>
#6.Verify Docker Swarm Setup
docker node ls

###docker-swarm1-joned-token noted
## docker swarm join --token SWMTKN-1-52arptrew5kffnr50pjt9knvgx354jyx4ybp1palpto4nu6s4e-4c3piqoi3qixn8v2oxn7pxd9k 64.226.67.29:2377

###docker-swarm2-joined-token noted
##    docker swarm join --token SWMTKN-1-5j6ozctaj0exfdpzuemxu0z0j0ojgxmoy6n645us7jh5r0j747-99cjuj22acv3zatnhxpcl95t7 64.226.67.16:2377

###docker-swarm3-joined-token noted
## To add a worker to this swarm, run the following command:
   #    docker swarm join --token SWMTKN-1-04yxafk86dgrp8sgju277rc983vk21xbh5fn96o2bxoenz0i31-4esr2wz2vat1bv8j7zdtm5l6m 64.226.67.56:2377