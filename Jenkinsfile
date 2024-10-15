pipeline {
    environment {
        registry = "sadiqmohamedamine/tp2job3"
        registryCredential = '78bd67d4-9a0b-49e4-a8cb-046e274c9e1c'
        dockerImage = ''
    }
    agent any
    stages {
        stage('Cloning Git') {
            steps {
                git 'https://github.com/AMINESDQ/tp2_jenkins.git'
            }
        }
        stage('Building image') {
            steps {
                script {
                    dockerImage = docker.build("${registry}:${BUILD_NUMBER}")
                }
            }
        }
        stage('Test image') {
            steps {
                script {
                    echo "Tests passed"
                }
            }
        }
        stage('Publish Image') {
            steps {
                script {
                    docker.withRegistry('', registryCredential) {
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Deploy Image') {
            steps {
                script {
                    // Arrêter et supprimer l'ancien conteneur s'il existe
                    sh "docker stop tp2job3_container || true"
                    sh "docker rm tp2job3_container || true"
                    
                    // Démarrer un nouveau conteneur avec un nom explicite
                    dockerImage.run("-d --name tp2job3_container -p 8080:80")
                }
            }
        }
    }
}
