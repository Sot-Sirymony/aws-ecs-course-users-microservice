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
