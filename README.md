# jenkins-slave-docker
An image to use with the [Jenkins Docker Plugin](https://wiki.jenkins.io/display/JENKINS/Docker+Plugin)

It has a bunch of useful tools that a Jenkins job might take advantage of, such as:
* Git
* Maven
* NodeJS
* Bash
* Curl
* Java
* Mysql client
* Python
* OpenSSH client
* Chromium

To configure in Jenkins, go to Manage Jenkins -> Manage Nodes and Clouds -> Configure Clouds. Under Docker Agent templates:
* Docker Image = mfugate/jenkins-slave-docker:latest
* Remote File System Root = /home/jenkins
* Connect method = Attach Docker Container
* User = jenkins