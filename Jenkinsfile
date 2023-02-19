pipeline {
        agent any
     

    stages {
    
        stage('git clone') {
                steps {
                     git branch: 'main', credentialsId: 'jenkins', url: 'git@gitlab.com:Aguerbaoui/project-8.git'
            
            
                }
        
        }

        stage('Build') {
                steps {
                     withMaven(maven: 'Maven') {
                    sh script: 'mvn clean install package'}
        
                }
        }



      stage('Docker Build and Tag') {
           steps {
              dockerImage = docker.build("nadiaaguerbaoui1/tomcat-image:latest")
           
          }
        }
     
         stage('Publish image to Docker Hub') {
          
            steps {
                withDockerRegistry([ credentialsId: "dockerHub", url: "" ]) {
                   
                   dockerImage.push()
                  
                   }
      
                  
          }
        }



  
     

    } 

} 
