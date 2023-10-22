# Use an official OpenJDK runtime as a parent image
FROM openjdk:11-jre-slim

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Compile the Java program
RUN javac HelloWorld.java

# Run the Java program
CMD ["java", "HelloWorld"]
