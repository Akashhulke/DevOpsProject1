pipeline {
    agent any
    
    environment {
        JAVA_HOME = '/usr/lib/jvm/java-11-openjdk-amd64'
        DOCKER_HUB_USERNAME = credentials('akashhulke')
        DOCKER_HUB_PASSWORD = credentials('wu6r7spYj!HspCe')
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
                    sh "docker login -u $DOCKER_HUB_USERNAME -p $DOCKER_HUB_PASSWORD"
                    customImage.push()
                    sh "docker logout"    
                }   
            }
        }
    }
}
