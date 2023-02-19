FROM tomcat:latest

LABEL maintainer="Aguerbaoui Nadia"

#ARG Path= /home/ubuntu

COPY ./webapp/target/webapp.war /usr/local/tomcat/webapps

EXPOSE 8080

CMD ["catalina.sh", "run"]

