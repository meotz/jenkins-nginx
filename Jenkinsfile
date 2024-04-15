pipeline {
  agent {label 'docker'} 
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t meox73/jenkins-nginx:firstjenkins .'
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
        sh 'docker push meox73/jenkins-nginx:firstjenkins'
      }
    }
    stage('Deploy') {
            steps {
              script {
                   sh "docker run --name=mywebapp1 -d -p 8084:80 meox73/jenkins-nginx:firstjenkins"
                }
              }
            }
        }
    }
