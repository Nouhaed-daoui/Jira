pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Package') {
            steps {
                sh 'mvn package'
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    def appName = "my-spring-boot-app"
                    def dockerImage = "${appName}:${BUILD_NUMBER}"
                    def registryUrl = "your-docker-registry-url"

                    // Build the Docker image
                    sh "docker build -t ${dockerImage} ."

                    // Push the image to a Docker registry
                    
                }
            }
        }

        stage('Deploy') {
            steps {
                // Add your deployment steps here, e.g., deploying to a Kubernetes cluster
            }
        }
      
    }
}
