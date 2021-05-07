####
# This Dockerfile is used in order to build a distroless container that runs the Quarkus application in native (no JVM) mode
#
# Before building the container image run:
#
# ./mvnw package -Pnative
#
# Then, build the image with:
#
# docker build -f src/main/docker/Dockerfile.native-distroless -t quarkus/code-with-quarkus .
#
# Then run the container using:
#
# docker run -i --rm -p 8080:8080 quarkus/code-with-quarkus
#
###
FROM registry.access.redhat.com/ubi8/openjdk-11
WORKDIR /source
RUN echo $(ls -1)
COPY target/code-with-quarkus-1.0.0-SNAPSHOT.jar first-quarkus.jar

#EXPOSE 8080
USER nonroot

ENTRYPOINT ["java", "-jar", "first-quarkus.jar"]