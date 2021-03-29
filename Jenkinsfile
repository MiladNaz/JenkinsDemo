pipeline {
    agent any
    tools{
        maven 'Maven 3.6.3'
        jdk 'JDK_16'
    }

    stages {
        stage('Hello') {
            steps {
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
    }
}