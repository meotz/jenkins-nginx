pipeline {
  agent {label 'cluster-manager'} 
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('harbor')
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t registry.devops.local/devops/jenkins-nginx .'
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
        sh 'docker push registry.devops.local/devops/jenkins-nginx'
      }
    }
    stage('Deploy') {
            steps {
              script {
                   sh "kubectl apply -f service.yml -f deployment.yml"
                }
              }
            }
        }
    }
