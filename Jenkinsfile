pipeline {
        agent any
    stages {
    
        stage('git clone') {
            steps {
                git branch: 'main', credentialsId: 'jenkins', url: 'git@gitlab.com:Aguerbaoui/project-5.git'
            
            
            }
        
        }

        stage('Build') {
             steps {
                 withMaven(maven: 'Maven') {
                 sh script: 'mvn clean install package'}
        
                }
        }
    def invokeAnsiblePlaybook() {
        echo ("Start invokeAnsiblePlaybook")
        ansiblePlaybook become: true, credentialsId: 'private_key1', installation: 'ansible', inventory: 'ansible/inventory/hosts', playbook: 'ansible/playbooks/copyfile.yml'
        echo ("End invokeAnsiblePlaybook")
                    
                    }

    } 

} 

