pipeline {
    agent any
    tools{
        maven 'Maven 3.6.3'
        jdk 'JDK_16'
    }

    stages {
        stage('Hello') {
            steps {
                sh 'mvn release:update-versions'
                sh 'mvn release:update-versions -DautoVersionSubmodules=true'
                sh 'mvn --batch-mode release:update-versions -DdevelopmentVersion=1.2.0-SNAPSHOT'

                echo 'Hello World'
                sh 'java --version'
                sh 'mvn clean compile'
            }
        }
        stage('Test'){
            steps{
                sh 'mvn test'
            }
        }
        stage('Packing to JAR'){
            steps{
                sh 'mvn package'
            }
        }

        stage('Create docker image') {
            steps {
                sh 'docker build -t miladnazarii/jenkinsdemo:1.0 .'
            }
        }
        stage('Push image to docker hub'){
            steps{
                withDockerRegistry([credentialsId: "DockerLogin", url: ""]){
                    sh 'docker push miladnazarii/jenkinsdemo:1.0'
                }
            }
        }
    }
}