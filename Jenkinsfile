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
                    // Access customImage here
                    customImage.push()
                }
            }
        }
    }
}

