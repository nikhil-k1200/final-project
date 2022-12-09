FROM tomcat
COPY /mnt/webapp/target/WebApp.war /usr/local/tomcat/webapps/
