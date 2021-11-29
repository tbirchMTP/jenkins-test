def target_host="ast26-jenkins"
def target_port="8080"

pipeline {
    
    agent {
        docker { image 'node:14-alpine' }
    }
    
    stages {
        stage('Hello') {
            steps {
                sh 'echo Hola mundo'
            }
        }
        
        stage('Test') {
            steps {
                sh 'node --version'
            }
        }
    }
}
