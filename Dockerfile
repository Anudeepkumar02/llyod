FROM tomcat:8
MAINTAINER Anudeepkumar@gmail.com
COPY target/*war /usr/loca/tomcat/webapps/
CMD ['sleep']
