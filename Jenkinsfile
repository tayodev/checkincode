pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps{
                checkout scm
            }

        }
        stage('Test') {
            steps{
                sh "ls -latr"
                sh "pwd"
            }
        }
        stage('Copy') {
          steps{
              withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                  sh "/usr/bin/aws s3 ls"
                  sh "/usr/bin/aws s3 sync . s3://tayobucbuc/myfiles/ --delete"
               }

          }
        }
    }
}  
