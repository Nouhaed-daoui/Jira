pipeline {
    agent any

    
    tools {
        
        maven  'Maven' // Use the name you configured in Jenkins
        jdk 'JDK'      
        
    }
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
                
                sh "docker run -d -p 8083:8082 ${dockerImage} "
            }
        }
      
    }
}
