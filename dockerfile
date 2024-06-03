FROM openjdk:21-jdk
WORKDIR /opt/app
COPY target/PhotoAppApiUsers-0.0.1-SNAPSHOT.jar users-microservice.jar
EXPOSE 8080
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","users-microservice.jar"]
