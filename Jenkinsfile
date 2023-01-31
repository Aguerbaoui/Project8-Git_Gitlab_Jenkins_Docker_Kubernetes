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
                sh script: 'mvn clean install package'
            }
        }
    }

    } 
   /*   post {
        success {
            emailext body: "${currentBuild.currentResult}: Job ${env.JOB_NAME}\nMore Info can be found here: ${env.BUILD_URL}", recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']], subject: 'Test'
             
        }
    } */

} 

