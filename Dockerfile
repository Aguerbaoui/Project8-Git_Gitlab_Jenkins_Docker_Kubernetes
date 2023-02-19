FROM tomcat:latest

LABEL maintainer="Aguerbaoui Nadia"

#ARG Path= /home/ubuntu

COPY /var/lib/jenkins/workspace/Project08-Git-Gitlab-Jenkins-Kubernetes/webapp/target/webapp.war /usr/local/tomcat/webapps

EXPOSE 8080

CMD ["catalina.sh", "run"]

