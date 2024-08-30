FROM maven:3.8.4-openjdk-17 as builder
WORKDIR /appb
COPY . /appb/.
RUN mvn -f /appb/pom.xml clean package -Dmaven.test.skip=true

FROM eclipse-temurin:17-jre-alpine
WORKDIR /appb
COPY --from=builder /appb/target/*.jar /appb/*.jar
EXPOSE 8085
ENTRYPOINT ["java", "-jar", "/app/*.jar"]


#FROM openjdk:8-jdk-alpine
#ARG JAR_FILE=target/*.jar
#COPY ${JAR_FILE} app.jar
#ENTRYPOINT ["java","-jar","/app.jar"]

#FROM eclipse-temurin:17.0.8.1_1-jre-alpine
#EXPOSE 8085
#WORKDIR /app
#COPY build/libs/*.jar app.jar
#ENTRYPOINT ["java", "-jar", "app.jar"]

