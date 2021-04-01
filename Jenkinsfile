pipeline {
    agent any

    POM_VERSION = readMavenPom().getVersion()
    BUILD_RELEASE_VERSION = readMavenPom().getVersion().replace("-SNAPSHOT", "")
    IS_SNAPSHOT = readMavenPom().getVersion().endsWith("-SNAPSHOT")
    GIT_TAG_COMMIT = sh(script: 'git describe --tags --always', returnStdout: true).trim()

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
        stage('Packing to JAR'){
            steps{
                sh 'mvn package'
            }
        }

        stage('Create docker image') {
            steps {
                sh 'docker build -t miladnazarii/jenkinsdemo:$POM_VERSION .'
            }
        }
        stage('Push image to docker hub'){
            steps{
                withDockerRegistry([credentialsId: "Git", url: ""]){
                    sh 'docker push miladnazarii/jenkinsdemo:$POM_VERSION'
                }
            }
        }
    }
}