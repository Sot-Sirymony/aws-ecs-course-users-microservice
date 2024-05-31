#1.SSH into Your Droplet:
ssh root@your_droplet_ip
#3.Update and Install Necessary Packages:
#Once logged in, update your package lists:
# Update the package index
# Update the package index
# Update the package index
# Update the package index
sudo apt-get update -y
sudo apt-get upgrade -y

# Install OpenJDK 11 (if JDK 21 is not available)
sudo apt install openjdk-21-jdk -y

# Check Java version
java -version

# Download and import the Jenkins repository key
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

# Add the Jenkins repository to the system's sources list
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update the package index again
sudo apt update

# Install Jenkins
sudo apt install jenkins -y

#check jenkin installed
sudo systemctl status jenkins
#first time need unlock jenkin
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
#note password shown after unlock
#root@Jenkin-Server-2:~# sudo cat /var/lib/jenkins/secrets/initialAdminPassword
#5493be102f384f37b7a00515c07d516d

###note from server jenkin run bellow worked
#http://164.90.166.214:8080/login?from=%2F





#Configure Jenkins:
#Once logged in, configure Jenkins according to your requirements. This might include setting up agents, configuring security, adding build jobs, etc.


####link config jenkin in droplets
##https://www.digitalocean.com/community/tutorials/how-to-install-jenkins-on-ubuntu-22-04