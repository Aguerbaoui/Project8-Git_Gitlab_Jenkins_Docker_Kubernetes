
pipeline {
        agent any

    stages {
    
        stage('git clone') {
                steps {
                     git branch: 'main', credentialsId: 'jenkins', url: 'git@gitlab.com:Aguerbaoui/project-7.git'
            
            
                }
        
        }

        stage('Build') {
                steps {
                     withMaven(maven: 'Maven') {
                    sh script: 'mvn clean install package'}
        
                }
        }
        stage('Install and configuer Docker'){
                steps{

                    echo ("Start invokeAnsiblePlaybook")
                    ansiblePlaybook become: true, colorized: true, credentialsId: 'private_key1', disableHostKeyChecking: true, installation: 'ansible', inventory: 'ansible/inventory/hosts', playbook: 'ansible/playbooks/playbook.yml'
                    echo ("End invokeAnsiblePlaybook")
       

                }

        }
        
        stage('Build image and run Docker container on remote host') {
                steps {
                    sshPublisher(publishers: [sshPublisherDesc(configName: 'ubuntu', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '''docker stop tomcat-container; 
                            docker rm tomcat-container; 
                            docker rmi tomcat-image; 
                            docker build -t tomcat-image .; 
                            docker run -d --name tomcat-container -p 8080:8080 tomcat-image; ''', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: 'webapp/target', sourceFiles: 'webapp/target/*.war')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
              
                }
        }
  
     

    } 

} 

