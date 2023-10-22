pipeline {
    agent any
    
    environment {
        JAVA_HOME = '/usr/lib/jvm/java-11-openjdk-amd64'
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Run the javac compiler
                    sh "${env.JAVA_HOME}/bin/javac HelloWorld.java"
                    
                    // Build the Docker image
                    customImage = docker.build("akashhulke/helloword:${env.BUILD_ID}")
                }
            }
        }
        stage('Push Docker Image to Docker Hub') {
            steps {
                 script {
                     withCredentials([usernamePassword(credentialsId: 'DockerPass2', usernameVariable: 'DOCKER_HUB_USERNAME', passwordVariable: 'DOCKER_HUB_PASSWORD')]) {
                         // Use the credentials to authenticate and push the Docker image
                        docker.withRegistry('https://registry.hub.docker.com', 'DOCKER_HUB_CREDENTIALS') {
                        customImage.push()
                         }
                    }   
                }
            }
        }
    }
}

