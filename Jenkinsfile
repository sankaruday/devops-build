pipeline {
    agent any
    environment {
        DOCKER_HUB_USER = 'uday2097'
        DOCKER_CREDS_ID = 'docker-hub-creds'
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build & Push') {
            steps {
                script {
                    sh "chmod +x build.sh"
                    sh "./build.sh"
                    
                    // Logic for Dev Branch
                    if (env.BRANCH_NAME == 'dev') {
                        withCredentials([usernamePassword(credentialsId: "${DOCKER_CREDS_ID}", passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                            sh "docker tag dev-image:latest ${DOCKER_HUB_USER}/dev:latest"
                            sh "echo \$PASS | docker login -u \$USER --password-stdin"
                            sh "docker push ${DOCKER_HUB_USER}/dev:latest"
                        }
                    } 
                    // Logic for Master/Main Branch
                    else if (env.BRANCH_NAME == 'master' || env.BRANCH_NAME == 'main') {
                        withCredentials([usernamePassword(credentialsId: "${DOCKER_CREDS_ID}", passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                            sh "docker tag dev-image:latest ${DOCKER_HUB_USER}/prod:latest"
                            sh "echo \$PASS | docker login -u \$USER --password-stdin"
                            sh "docker push ${DOCKER_HUB_USER}/prod:latest"
                        }
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                sh "chmod +x deploy.sh"
                sh "./deploy.sh"
            }
        }
    }
}
