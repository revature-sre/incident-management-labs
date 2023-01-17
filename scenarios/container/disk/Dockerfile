FROM maven:3-eclipse-temurin-11-alpine as builder
COPY ./src src
COPY ./pom.xml pom.xml
RUN mvn clean package -DskipTests=true

FROM openjdk:11.0.11-jre-slim
COPY --from=builder target/app.jar app.jar

RUN apt update && apt install at cron sudo vim unzip wget curl -y

COPY ./saturate-disk.sh /usr/local/etc/saturate-disk.sh
RUN chmod 0644 /usr/local/etc/saturate-disk.sh

RUN sudo touch /etc/cron.d/schedule
RUN echo "SHELL=/bin/bash" > /etc/cron.d/schedule
RUN echo "0 * * * * root echo "\"sh /usr/local/etc/saturate-disk.sh"\" | at now + \$(( RANDOM \% 10 )) minutes > /dev/null" >> /etc/cron.d/schedule
RUN sudo chmod 600 /etc/cron.d/schedule

ENTRYPOINT ["java","-jar","app.jar"]