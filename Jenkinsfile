pipeline {
    agent any
    
    stages {
        stage('Hello') {
            steps {
                sh 'echo Hello World!'
            }
        }
        stage('Performance') {
            agent { kubernetes { yamlFile 'build-pod.yaml' } }
            steps {
                container('jmeter') {
                    sh 'jmeter -n -t /jmeter-scripts/localhost8080.jmx'
                }
            }
        }
    }
}
