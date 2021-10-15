def target_host="ast26-jenkins"
def target_port="8080"

pipeline {
    agent any
    
    stages {
        stage('Hello') {
            steps {
                sh 'echo Hello World!'
            }
        }
        stage('Performance') {
            agent {
                kubernetes {
                    yaml '''
apiVersion: v1
kind: Pod
spec:
  containers:
    - name: jmeter
      image: ast26/jmeter
      imagePullPolicy: Never
'''
                }
            }
            steps {
                container('jmeter') {
                    sh "jmeter -n -t scripts/localhost8080.jmx -Jurl=${target_host} -Jport=${target_port} -f -l jenkins.io.report.jtl"
                    perfReport filterRegex: '', showTrendGraphs: true, sourceDataFiles: 'jenkins.io.report.jtl'
                }
            }
        }
        stage('Dependency Check') {
            steps {
                dependencyCheck additionalArguments: '', odcInstallation: '6.4.1'
                dependencyCheckPublisher pattern: ''
            }
        }
    }
}
