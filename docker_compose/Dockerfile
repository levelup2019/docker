FROM maven:3-jdk-8
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git \
    && mvn -f ./boxfuse-sample-java-war-hello/pom.xml clean package \
    && mkdir /var/webapps