pipeline {
    agent any
    environment {
        DOCKER_HUB_USER = 'uday2097' 
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm [cite: 8]
            }
        }
        stage('Build & Push') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'dev') {
                        sh "./build.sh"
                        docker.withRegistry('', 'docker-hub-creds') {
                            def devImage = docker.build("${DOCKER_HUB_USER}/dev:latest")
                            devImage.push()
                        }
                    } 
                    else if (env.BRANCH_NAME == 'main') {
                        sh "./build.sh"
                        docker.withRegistry('', 'docker-hub-creds') {
                            def prodImage = docker.build("${DOCKER_HUB_USER}/prod:latest")
                            prodImage.push()
                        }
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                sh "./deploy.sh" [cite: 4, 7]
            }
        }
    }
}
