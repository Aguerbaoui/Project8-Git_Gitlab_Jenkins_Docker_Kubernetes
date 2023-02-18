pipeline {
        agent any
      /*  environement{

            DOCKERHUB_CREDENTIALS=credentials('dockerhub')
        }*/

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
              
                  sh 'docker build -t tomcat-image .' 
                  sh 'docker tag nginxtest nadiaaguerbaoui1/tomcat-image:latest'
                  sh 'docker tag nginxtest nadiaaguerbaoui1/tomcat-image:$BUILD_NUMBER'
               
          }
        }



       /* stage('Copy and build the Dockerfile ')
        {

                steps{

                  sshPublisher(publishers: [sshPublisherDesc(configName: 'ubuntu', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: 'docker images', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: 'Dockerfile')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])


                }
        }

      */
        
      /*  stage('Build image and run Docker container on remote host') {
                steps {
                    sshPublisher(publishers: [sshPublisherDesc(configName: 'ubuntu', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '''docker stop tomcat-container; 
                            docker rm tomcat-container; 
                            docker rmi tomcat-image; 
                            docker build -t tomcat-image .; 
                            docker run -d --name tomcat-container -p 8080:8080 tomcat-image; ''', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: 'webapp/target', sourceFiles: 'webapp/target/*.war')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
              
                }
        }*/

     /*  stage('Docker Build and Tag') {
           steps {
              
                sh 'docker build -t nginxtest:latest .' 
                  sh 'docker tag nginxtest nikhilnidhi/nginxtest:latest'
                sh 'docker tag nginxtest nikhilnidhi/nginxtest:$BUILD_NUMBER'
               
          }
        }*/
        
     
         stage('Publish image to Docker Hub') {
          
            steps {
                withDockerRegistry([ credentialsId: "dockerHub", url: "" ]) {
                    sh  'docker push nadiaaguerbaoui1/tomcat-image:latest'
                    sh  'docker push nadiaaguerbaoui1/tomcat-image:$BUILD_NUMBER' 
                   }
                  
          }
        }



  
     

    } 

} 
