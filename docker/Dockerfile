FROM tomcat:8.5
LABEL maintainer="daniil"
RUN apt-get update && \
    apt-get install -y maven && \
    git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git && \
    mvn -f ./boxfuse-sample-java-war-hello/pom.xml clean package && \
    cp ./boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]
EXPOSE 8080
