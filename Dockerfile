FROM jenkins/jenkins:lts

USER root
# Install JMeter version 5, as root
RUN apt-get update && apt-get install -y wget tar
RUN wget https://dlcdn.apache.org//jmeter/binaries/apache-jmeter-5.4.1.tgz
RUN tar -xvzf apache-jmeter-5.4.1.tgz -C /opt && rm apache-jmeter-5.4.1.tgz
RUN ln -s /opt/apache-jmeter-5.4.1/bin/jmeter /usr/bin/jmeter

## Drop back to the regular jenkins user (good practice)
USER jenkins

# Copy JMeter scripts
COPY /scripts /jmeter-scripts

# Install Jenkins plugins
RUN jenkins-plugin-cli --plugins kubernetes workflow-aggregator git configuration-as-code docker-workflow docker-plugin performance
