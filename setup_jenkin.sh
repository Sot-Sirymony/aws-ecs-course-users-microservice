#1.SSH into Your Droplet:
ssh root@your_droplet_ip
#3.Update and Install Necessary Packages:
#Once logged in, update your package lists:
sudo apt update
#Install Java, as Jenkins requires Java to run:
sudo apt install adoptopenjdk-21-hotspot
#java --version
java -version
#4.Download and Install Jenkins:
#Add the Jenkins repository key to your system:
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
#Append the Debian package repository address to the server's sources.list
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
#Update your package lists again:
sudo apt update
#Install Jenkins:
sudo apt install jenkins -y
#5.Start Jenkins:
#Once installed, start the Jenkins service
sudo systemctl start jenkins
#Enable Jenkins to start on boot
sudo systemctl enable jenkins
#Configure Jenkins:
#Once logged in, configure Jenkins according to your requirements. This might include setting up agents, configuring security, adding build jobs, etc.

