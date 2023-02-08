Setps to release this project 5 
Git --> Gitlab ---> sv1:Jenkins (avec Jenkinsfile) ---> sv1:Ansible (Install Tomcat with Playbook) ---> sv2:Tomcat: projet j2e
## Step 1:
Create an ec2 instance server 2
## Step 2:
Install docker using this link:
https://docs.docker.com/engine/install/ubuntu/
*************
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
************
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
************
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
**********
sudo apt-get update
**********
sudo chmod a+r /etc/apt/keyrings/docker.gpg
sudo apt-get update
*********
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
*********
sudo docker run hello-world
## Step 2 
pull an image from docker hub using this command
docker pull tomcat
en se basant sur le lien suivant:
https://shootskill.com/tutorials/devops-set-ci-cd-pipeline-git-jenkins-docker/4/
## Create a Dockerfile
you can find attached in this project
## ensure the communication between Jenkins and Docker unsing the plugin Publish Over ssh can test using Maven project


