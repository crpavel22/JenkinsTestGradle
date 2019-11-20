#FROM gradle:4.10.0-jdk8-alpine AS build
#COPY --chown=gradle:gradle . /home/gradle/src
#WORKDIR /home/gradle/src
#RUN gradle clean build --no-daemon

FROM openjdk:8-jre-slim

EXPOSE 8181

COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src

RUN mkdir /app

COPY  /home/gradle/src/build/libs/*.jar /app/spring-boot-application.jar

ENTRYPOINT ["java", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", "-Djava.security.egd=file:/dev/./urandom","-jar","/app/spring-boot-application.jar"]