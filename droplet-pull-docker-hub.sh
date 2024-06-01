#instlall docker first
sudo apt update
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
#check docker
docker --version

#pull docker image fron docker hub
docker pull yourusername/yourimage:tag
#run docker container
docker run -d -p 8080:80 yourusername/yourimage:tag
#or port 8081
docker run -d -p 8081:80 yourusername/yourimage:tag
#allow port 8080
#allow firewall port 8080
ufw status
   ufw allow 8080
#
sudo ufw allow 8080/tcp

#check docker run service
docker ps
#check docker log run spring run
docker logs pensive_ride

#access api test
curl http://165.227.151.118:8080/health

curl http://161.35.218.33:8080/health


#made to listen port 8080
apt-get update && apt-get install net-tools
netstat -tuln | grep 8080



#### for solve port
step1. add network Droplet firewall allow port
step2. enable firweall
sudo ufw enable
Step3. list port allowed:
sudo ufw status