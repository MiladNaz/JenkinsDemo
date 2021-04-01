FROM payara/server-web:5.2021.1-jdk11
EXPOSE 8080
COPY ./target/JenkinsDemo-1.0-SNAPSHOT.jar $DEPLOY_DIR