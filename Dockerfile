# Stage 1: Build the JAR file
FROM gradle:8.10.2-jdk21 as gradle

WORKDIR /app

# Copy Java Backend files into container
COPY build.gradle .
COPY src ./src

# Build the dependencies
RUN gradle dependencies --no-daemon

# Build the Java Backend
RUN gradle bootJar --no-daemon


# Stage 2: Set up the JAR file as an executable
FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

COPY --from=gradle /app/build/libs/demeter.jar demeter.jar

# Run the backend
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "demeter.jar"]
