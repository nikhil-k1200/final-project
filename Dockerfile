FROM tomcat
COPY /mnt/webapp/target/ /usr/local/tomcat/webapps/
