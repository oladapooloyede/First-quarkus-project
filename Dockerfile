FROM registry.access.redhat.com/ubi8/openjdk-11-runtime:latest
USER 1001

WORKDIR target

RUN dir

# We make four distinct layers so if there are application changes the library layers can be re-used
COPY quarkus-app/lib/ lib/
COPY quarkus-app/*.jar .
COPY quarkus-app/app/ app/
COPY quarkus-app/quarkus/ quarkus/

EXPOSE 8080
ENTRYPOINT [ "java", "-jar","quarkus-run.jar" ]