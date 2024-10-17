FROM maven:3.6.3-jdk-8 AS build

WORKDIR /app
COPY . .
RUN mvn clean package
FROM openjdk:8-jre

WORKDIR /app
COPY --from=build /app/target/hello-world-0.0.1-SNAPSHOT.jar /app/hello-world.jar

# Run the application
ENTRYPOINT ["java", "-jar", "/app/hello-world.jar"]