# Use the official Maven image as a parent image
FROM maven:3.8-openjdk-11-slim AS builder

# Set the working directory
WORKDIR /app

# Copy the project's POM file and download dependencies
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copy the application source code
COPY src src

# Build the application
RUN mvn package -DskipTests

# Use a lightweight Alpine Linux image as the final base image
FROM adoptopenjdk:11-jre-hotspot

# Set the working directory
WORKDIR /app

# Copy the built JAR file from the previous stage
COPY --from=builder /app/target/*.jar app.jar

# Expose the port your Spring Boot application uses (default is 8080)
EXPOSE 8082

# Define the command to run your application
CMD ["java", "-jar", "app.jar"]
