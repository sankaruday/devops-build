pipeline {
    agent any
    environment {
        // Updated with your actual Docker Hub username
        DOCKER_HUB_USER = 'uday2097' 
    }
    stages {
        stage('Checkout') {
            steps {
                // Pulls the code from your GitHub fork [cite: 8]
                checkout scm
            }
        }
        stage('Build & Push') {
            steps {
                script {
                    // Logic for Dev Branch: Push to Public Repo [cite: 6, 9]
                    if (env.BRANCH_NAME == 'dev') {
                        sh "chmod +x build.sh"
                        sh "./build.sh"
                        docker.withRegistry('', 'docker-hub-creds') {
                            def devImage = docker.build("${DOCKER_HUB_USER}/dev:latest")
                            devImage.push()
                        }
                    } 
                    // Logic for Master/Main Branch: Push to Private Repo [cite: 6, 10]
                    else if (env.BRANCH_NAME == 'master' || env.BRANCH_NAME == 'main') {
                        sh "chmod +x build.sh"
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
                // Deploys to your AWS server using the bash script [cite: 4, 11]
                sh "chmod +x deploy.sh"
                sh "./deploy.sh"
            }
        }
    }
}
