FROM payara/server-web:5.2021.1-jdk11
EXPOSE 8080
COPY ./target/*.jar $DEPLOY_DIR