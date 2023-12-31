FROM ubuntu
MAINTAINER Abdul
WORKDIR /opt
RUN touch Abdul
RUN apt update -y
RUN apt install wget -y
RUN apt install fontconfig -y

RUN wget https://github.com/adoptium/temurin8-binaries/releases/download/jdk8u372-b07/OpenJDK8U-jdk_x64_linux_hotspot_8u372b07.tar.gz
RUN wget https://dlcdn.apache.org/maven/maven-3/3.9.3/binaries/apache-maven-3.9.3-bin.tar.gz
RUN wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.90/bin/apache-tomcat-8.5.90.tar.gz

RUN tar -zxvf OpenJDK8U-jdk_x64_linux_hotspot_8u372b07.tar.gz
RUN tar -zxvf apache-maven-3.9.3-bin.tar.gz
RUN tar -zxvf apache-tomcat-8.5.90.tar.gz

RUN rm -rf OpenJDK8U-jdk_x64_linux_hotspot_8u372b07.tar.gz
RUN rm -rf apache-maven-3.9.3-bin.tar.gz
RUN rm -rf apache-tomcat-8.5.90.tar.gz

RUN mv jdk8u372-b07 java8
RUN mv apache-maven-3.9.3 maven3
RUN mv apache-tomcat-8.5.90 tomcat8

RUN echo export JAVA_HOME=/opt/java8 >> /etc/profile
RUN echo export PATH=$PATH:/opt/java8/bin >> /etc/profile

RUN echo export MAVEN_HOME=/opt/maven3 >> /etc/profile
RUN echo export PATH=$PATH=/opt/maven3/bin >> /etc/profile

EXPOSE 8080

ENV JAVA_HOME "/opt/java8"
ENV PATH "${JAVA_HOME}/bin:${PATH}"
