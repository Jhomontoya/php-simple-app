pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = 'dockerhub-credentials-id'
        DOCKERHUB_REPO = 'jhomontoya/php-simple-app'  // minúsculas
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Jhomontoya/php-simple-app.git'  // sin espacios
            }
        }

        stage('Generate Tag') {
            steps {
                script {
                    def COMMIT_ID = sh(script: "git rev-parse --short HEAD", returnStdout: true).trim()
                    def DATE_TAG = sh(script: "date +%Y%m%d-%H%M%S", returnStdout: true).trim()
                    env.IMAGE_TAG = "${DATE_TAG}-${COMMIT_ID}"
                    echo "Tag generado: ${env.IMAGE_TAG}"
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${env.DOCKERHUB_REPO}:${env.IMAGE_TAG} -t ${env.DOCKERHUB_REPO}:latest ."
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                script {
                    withCredentials([
                        usernamePassword(
                            credentialsId: env.DOCKERHUB_CREDENTIALS,
                            usernameVariable: 'DOCKER_USER',
                            passwordVariable: 'DOCKER_PASS'
                        )
                    ]) {
                        sh """
                            echo "\$DOCKER_PASS" | docker login -u "\$DOCKER_USER" --password-stdin
                            docker push ${env.DOCKERHUB_REPO}:${env.IMAGE_TAG}
                            docker push ${env.DOCKERHUB_REPO}:latest
                            docker logout
                        """
                    }
                }
            }
        }

        stage('No Changes Check') {
            when { expression { true } }
            steps {
                echo "Validando si hay cambios (demo)..."
            }
        }
    }

    post {
        success {
            echo "     Imagen subida correctamente con tag ${env.IMAGE_TAG}"
        }
        failure {
            echo "    Error en el pipeline"
        }
    }
}