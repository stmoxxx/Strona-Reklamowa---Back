FROM maven:3.8.4-openjdk-17 as builder
WORKDIR /appb
COPY . /appb/.
RUN mvn -f /appb/pom.xml clean package -Dmaven.test.skip=true

FROM eclipse-temurin:17-jre-alpine
WORKDIR /appb
COPY --from=builder /appb/target/*.jar /appb/*.jar
EXPOSE 8085
ENTRYPOINT ["java", "-jar", "/app/*.jar"]

