pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('DockerPass')
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Define customImage as a global variable
                    def customImage

                    // Build the Docker image with the correct arguments
                    customImage = docker.build("akashhulke/helloworld:${env.BUILD_ID}", "--build-arg JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64 .")
                }
            }
        }
        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    // Push the Docker image to Docker Hub using Docker Hub credentials
                    withCredentials([usernamePassword(credentialsId: 'your-docker-hub-credentials-id', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                        sh "docker login -u \$DOCKERHUB_USERNAME -p \$DOCKERHUB_PASSWORD"
                        customImage.push()
                        sh "docker logout"
                    }
                }
            }
        }
    }
}
