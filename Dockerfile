FROM tomcat
COPY ./target/WebApp.war /usr/local/tomcat/webapps/
EXPOSE 8080
