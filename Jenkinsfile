def customImage // Define customImage as a global variable

pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image with the correct arguments
                    customImage = docker.build("akashhulke/helloworld:${env.BUILD_ID}", "--build-arg JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64 .")
                }
            }
        }
        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    customImage.push()
                }
            }
        }
    }
}
