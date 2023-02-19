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
            sh 'docker build -t nadiaaguerbaoui1/tomcat-image:latest .'
           
               }
        }
     /*  stage('Login') {
         steps {
           sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
        }
    
    
               }*/
     
         stage('Publish image to Docker Hub') {
          
            steps {
                withDockerRegistry([ credentialsId: "dockerHub", url: "" ]) {
                   
                   sh 'docker push nadiaaguerbaoui1/tomcat-image:latest'
                  
                   }
      
                  
          }
        }



  
     

    } 

} 
