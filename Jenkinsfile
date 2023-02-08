
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
        
         stage('Docker Test') {
                 steps {

                 sshPublisher(publishers: [sshPublisherDesc(configName: 'ubuntu', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: 'docker images; docker ps', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: 'webapp/target/*.war')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
              
                    //sh 'docker images .' 
                   // sh 'docker tag samplewebapp nikhilnidhi/samplewebapp:latest'
                
                 }
        }
        stage('Docker Build and Tag') {
                 steps {
              
                    sh 'docker build -t samplewebapp:latest .' 
                    sh 'docker tag samplewebapp nikhilnidhi/samplewebapp:latest'
                
                 }
        }
         stage('Publish image to Docker Hub') {
          
             steps {
                 withDockerRegistry([ credentialsId: "dockerHub", url: "" ]) {
                 sh  'docker push nikhilnidhi/samplewebapp:latest'
       
                     }
                  
                }
        }
          stage('Run Docker container on Jenkins Agent') {
             
            steps 
                {
                sh "docker run -d -p 8003:8080 nikhilnidhi/samplewebapp"
 
                 }
              }
      stage('Run Docker container on remote hosts') {
             
            steps {
                sh "docker -H ssh://jenkins@172.31.28.25 run -d -p 8003:8080 nikhilnidhi/samplewebapp"
 
            }
        }

    

    } 

} 

