pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    def customImage = docker.build("akashhulke/helloworld:${env.BUILD_ID}", "--build-arg JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64")

                    // Archive the Docker image
                    archiveArtifacts artifacts: '**/Dockerfile', allowEmptyArchive: true
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
