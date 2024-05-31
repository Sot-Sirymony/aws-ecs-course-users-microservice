#Step 2: Install Jenkins on a DigitalOcean Droplet
#Create a New Droplet for Jenkins:

#Create a new droplet to host Jenkins.
#Install Jenkins:

SSH into the Jenkins droplet and install Jenkins:
bash
#Copy code
sudo apt update
sudo apt install openjdk-11-jdk -y
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install jenkins -y
sudo systemctl start jenkins
sudo systemctl enable jenkins
#Access Jenkins Web Interface:

Open your web browser and go to http://<jenkins-droplet-ip>:8080.
#Follow the setup instructions and unlock Jenkins using the initial admin password found in:
#bash
#Copy code
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
#Step 3: Configure Jenkins for Docker and Docker Hub
#Install Necessary Jenkins Plugins:
#From the Jenkins dashboard, go to "Manage Jenkins" -> "Manage Plugins".
#In the "Available" tab, install the following plugins:
#Docker
#Docker Pipeline
#Git
#Pipeline
#Add Docker Hub Credentials to Jenkins:
#
#Go to "Manage Jenkins" -> "Manage Credentials".
#Add a new "Username with password" credential for Docker Hub.
#Add SSH Credentials for Docker Swarm Manager:
#
#Add an SSH credential for connecting to your Docker Swarm manager node.
#Step 4: Configure Jenkins Pipeline
#Create a New Pipeline Job:
#
#From the Jenkins dashboard, click on "New Item".
#Enter a name for your job and select "Pipeline", then click "OK".
#Define the Pipeline Script:
#
#In the "Pipeline" section, define your pipeline script. Here is an example Jenkinsfile:
#
pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = 'dockerhub-credentials'
        DOCKER_IMAGE = 'your-dockerhub-username/your-image-name'
        DOCKER_SWARM_MANAGER = 'user@swarm-manager-ip'
        SWARM_SSH_CREDENTIALS = 'swarm-ssh-credentials'
        TELEGRAM_BOT_TOKEN = 'your-telegram-bot-token'
        TELEGRAM_CHAT_ID = 'your-telegram-chat-id'
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://gitlab.com/your-username/your-repo.git'
            }
        }
        stage('Build') {
            steps {
                script {
                    dockerImage = docker.build("${DOCKER_IMAGE}:${env.BUILD_ID}")
                }
            }
        }
        stage('Push') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKERHUB_CREDENTIALS) {
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                sshagent([SWARM_SSH_CREDENTIALS]) {
                    sh """
                    ssh -o StrictHostKeyChecking=no ${DOCKER_SWARM_MANAGER} \\
                        'docker service update --image ${DOCKER_IMAGE}:${env.BUILD_ID} your_service_name'
                    """
                }
            }
        }
    }
    post {
        always {
            script {
                def message = "Build ${currentBuild.fullDisplayName} finished with status: ${currentBuild.currentResult}"
                sh "curl -s -X POST https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendMessage -d chat_id=${TELEGRAM_CHAT_ID} -d text=\"${message}\""
            }
        }
    }
}
