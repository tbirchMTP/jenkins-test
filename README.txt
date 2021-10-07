####################################################################################################################
### This project is a test. You may not use JMeter inside Jenkins. Use a separate node as Jenkins agent instead. ###
####################################################################################################################

## 1. Docker
docker build . -t ast26/jenkins

## 2. Kind
kind load docker-image ast26/jenkins

## 3. Helm 3 (https://artifacthub.io/packages/helm/jenkinsci/jenkins)
helm repo add jenkins https://charts.jenkins.io
helm repo update
#helm show values jenkins/jenkins
helm install ast26-jenkins jenkins/jenkins -f values.yaml
