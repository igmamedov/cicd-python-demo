pipeline {
    agent any

    environment {
        IMAGE_NAME = 'ilgarmamedov/cicd-python-demo'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install dependencies') {
            steps {
                sh 'python3 -m venv .venv'
                sh '. .venv/bin/activate && pip install --upgrade pip'
                sh '. .venv/bin/activate && pip install -r requirements.txt'
            }
        }

        stage('Run tests') {
            steps {
                sh '. .venv/bin/activate && pytest'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t ${IMAGE_NAME}:${BUILD_NUMBER} .'
                sh 'docker tag ${IMAGE_NAME}:${BUILD_NUMBER} ${IMAGE_NAME}:latest'
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKERHUB_USERNAME',
                    passwordVariable: 'DOCKERHUB_TOKEN'
                )]) {
                    sh 'echo $DOCKERHUB_TOKEN | docker login -u $DOCKERHUB_USERNAME --password-stdin'
                    sh 'docker push ${IMAGE_NAME}:${BUILD_NUMBER}'
                    sh 'docker push ${IMAGE_NAME}:latest'
                }
            }
        }
    }
}