pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = 'dockerhub-creds'    // תכף נוסיף ב-Jenkins
        DOCKERHUB_USERNAME = 'tesla7300'
        IMAGE_NAME = 'family_manager'
    }

    stages {
        stage('Clone repo') {
            steps {
                git credentialsId: 'github-creds-id', url: 'https://github.com/TalSinay/family_manager.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${env.BUILD_NUMBER}")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKERHUB_CREDENTIALS) {
                        dockerImage.push()
                    }
                }
            }
        }
    }
}
