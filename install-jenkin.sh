#1.SSH into Your Droplet:
ssh root@your_droplet_ip
#3.Update and Install Necessary Packages:
#Once logged in, update your package lists:
# Update the package index
sudo apt update

# Install OpenJDK 11 (if JDK 21 is not available)
sudo apt install openjdk-11-jdk -y

# Check Java version
java -version

# Download and import the Jenkins repository key
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -

# Add the Jenkins repository to the system's sources list
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# Update the package index again
sudo apt update

# Install Jenkins
sudo apt install jenkins -y

# Start Jenkins service
sudo systemctl start jenkins

# Enable Jenkins to start on boot
sudo systemctl enable jenkins

#Configure Jenkins:
#Once logged in, configure Jenkins according to your requirements. This might include setting up agents, configuring security, adding build jobs, etc.

