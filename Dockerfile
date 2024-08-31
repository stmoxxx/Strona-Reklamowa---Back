FROM maven:3.8.4-openjdk-17 as builder
WORKDIR /appback
COPY . /appback/.
RUN mvn -f /appback/pom.xml clean package -Dmaven.test.skip=true

FROM eclipse-temurin:17-jre-alpine
WORKDIR /appback
COPY --from=builder /appback/target/*.jar /appback/*.jar
EXPOSE 8085
ENTRYPOINT ["java", "-jar", "/appback/*.jar"]
