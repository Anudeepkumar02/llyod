FROM tomcat:8
MAINTAINER Anudeepkumar@gmail.com
COPY target/*war /usr/local/tomcat/webapps/
CMD ['sleep']
