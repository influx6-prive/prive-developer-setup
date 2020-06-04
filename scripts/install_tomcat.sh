#!/usr/bin/env bash

# create directory for new tooling
cd /usr/local/bin

# download tomcat7 for serving wars
wget http://www.trieuvan.com/apache/tomcat/tomcat-7/v7.0.90/bin/apache-tomcat-7.0.90.tar.gz
tar xvzf apache-tomcat-7.0.90.tar.gz

echo "PATH=/usr/local/bin/apache-tomcat-7.0.90/bin:$PATH" >> ~/.bashrc
echo "PATH=/usr/local/bin/apache-tomcat-7.0.90/bin:$PATH" >> ~/.profile
