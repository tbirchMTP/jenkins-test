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
                    sh 'jmeter -n -t scripts/localhost8080.jmx -Jurl=localhost -Jport=8080 -f -l jenkins.io.report.jtl'
                }
            }
        }
    }
}
