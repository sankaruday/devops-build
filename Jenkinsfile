pipeline {
    agent any
    
    environment {
        // Your Docker Hub details
        DOCKER_HUB_USER = 'uday2097'
        DOCKER_CREDS_ID = 'docker-hub-creds'
        IMAGE_NAME = 'dev-image'
    }

    stages {
        stage('Checkout') {
            steps {
                // Pulls code from your GitHub repository
                checkout scm
            }
        }

        stage('Build & Push') {
            steps {
                script {
                    // Make sure the build script is executable
                    sh "chmod +x build.sh"
                    sh "./build.sh"

                    // Handle logic for the DEV branch (Public Repo)
                    if (env.BRANCH_NAME == 'dev') {
                        echo "Processing Development Branch..."
                        withCredentials([usernamePassword(credentialsId: "${DOCKER_CREDS_ID}", passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                            sh "docker tag ${IMAGE_NAME}:latest ${DOCKER_HUB_USER}/dev:latest"
                            sh "echo \$PASS | docker login -u \$USER --password-stdin"
                            sh "docker push ${DOCKER_HUB_USER}/dev:latest"
                        }
                    } 
                    
                    // Handle logic for the MAIN branch (Private Repo)
                    else if (env.BRANCH_NAME == 'main') {
                        echo "Processing Main/Production Branch..."
                        withCredentials([usernamePassword(credentialsId: "${DOCKER_CREDS_ID}", passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                            sh "docker tag ${IMAGE_NAME}:latest ${DOCKER_HUB_USER}/prod:latest"
                            sh "echo \$PASS | docker login -u \$USER --password-stdin"
                            sh "docker push ${DOCKER_HUB_USER}/prod:latest"
                        }
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                // Ensure the deployment script is executable and run it
                sh "chmod +x deploy.sh"
                sh "./deploy.sh"
            }
        }
    }

    post {
        success {
            echo "Pipeline completed successfully. App is live at http://13.200.21.175"
        }
        failure {
            echo "Pipeline failed. Check the console output for errors."
        }
    }
}
