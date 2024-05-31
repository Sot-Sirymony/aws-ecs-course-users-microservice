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
#3.Start and Enable Docker Service
#Start the Docker service and enable it to start on boot
sudo systemctl start docker
sudo systemctl enable docker
#4.Install Docker Swarm (Optional)
docker swarm init --advertise-addr <MANAGER_IP>
#5.Join Additional Nodes to the Swarm (Optional):
docker swarm join --token <TOKEN> <MANAGER_IP>:<PORT>
#6.Verify Docker Swarm Setup
docker node ls
