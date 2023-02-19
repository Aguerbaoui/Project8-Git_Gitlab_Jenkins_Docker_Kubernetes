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
           // sh 'docker tag tomcat-image nadiaaguerbaoui1/tomcat-image:$BUILD_NUMBER'
           
               }
        }
     
         stage('Publish image to Docker Hub') {
          
            steps {
                withDockerRegistry([ credentialsId: "dockerHub", url: "" ]) {
                   
                   sh 'docker push nadiaaguerbaoui1/tomcat-image:latest'
                  // sh 'docker push tomcat-image nadiaaguerbaoui1/tomcat-image:$BUILD_NUMBER'
                   }
      
                  
          }
        }
     stage('Deploy to k8s cluster'){
        steps{

            script{
                   // kubernetesDeploy (configs: 'dep.yaml', kubeconfigId: 'kubeconfig')
                    kubernetesDeploy configs: 'deploy.yaml', kubeConfig: [path: ''], kubeconfigId: 'kubeconfig', secretName: '', ssh: [sshCredentialsId: '*', sshServer: ''], textCredentials: [certificateAuthorityData: '', clientCertificateData: '', clientKeyData: '', serverUrl: 'https://']
                }

         }


     }
      

  
     

    } 

} 
