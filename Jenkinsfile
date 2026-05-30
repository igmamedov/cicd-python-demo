pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install uv') {
            steps {
                sh 'curl -LsSf https://astral.sh/uv/install.sh | sh'
                sh '$HOME/.local/bin/uv --version'
            }
        }

        stage('Run tests') {
            steps {
                sh '$HOME/.local/bin/uv sync --frozen'
                sh '$HOME/.local/bin/uv run pytest'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t cicd-python-demo:${BUILD_NUMBER} .'
                sh 'docker images | grep cicd-python-demo'
            }
        }
    }
}