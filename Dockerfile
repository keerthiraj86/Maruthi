FROM ubuntu

MAINTAINER keerthiraj 

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get install -y wget tar grep sed

RUN apt-get install -y openjdk-8-jdk -y

RUN cd /usr/local   && \
    wget http://www-us.apache.org/dist/tomcat/tomcat-9/v9.0.20/bin/apache-tomcat-9.0.20.tar.gz && \
    tar xzf apache-tomcat-9.0.20.tar.gz && \
    mv apache-tomcat-9.0.20 tomcat9 && \
    cd /usr/local/tomcat9/conf

#RUN cat /usr/local/tomcat9/conf/server.xml | grep "Connector port" | grep HTTP | sed 's/8080/9090/'

COPY helloworld.war /usr/local/tomcat9/webapps
RUN mkdir -p /usr/local/tomcat9/temp/

ENTRYPOINT ["/usr/local/tomcat9/bin/catalina.sh", "run"]

EXPOSE 8080
