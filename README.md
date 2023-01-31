Setps to release this project 5 
Git --> Gitlab ---> sv1:Jenkins (avec Jenkinsfile) ---> sv1:Ansible (Install Tomcat with Playbook) ---> sv2:Tomcat: projet j2e
## Step 1:
Create an ec2 instance server 2
## Step 2:
Enssure communication from Jenkins_Ansible Server 1 into server 2
Create user ansible from the server and client side using the following command for ubuntu ec2
** sudo adduser ansible
** sudo nano /etc/sudoers
** ansible ALL=(ALL) NOPASSWD:ALL
# client side 
sudo nano /etc/ssh/sshd_config
** #PasswordAuthentication no
** PasswordAuthentication yes
** sudo systemctl reload sshd
# server side
ssh-keygen -t rsa
ssh-copy-id ansadmin@adresse_ip_serveur_client , enter ip a to know the local address
# Change in the inventory file 
nano /etc/ansible/hosts 
# Teste de la connexion
 ansible all -m ping 
 ## Step 3:
 Prepare the jenkinsfile
 ## Step 4:
 Prepare the playbook to install tomcat 
 ## Step 5: optinal
 Repeat project 4 with jenkinsfile
 deploy on tomcat  
