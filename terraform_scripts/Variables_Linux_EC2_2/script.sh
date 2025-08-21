#!/bin/bash
yum update -y
yum install httpd* -y
systemctl start httpd
systemctl start httpd
echo "Hello Avisek" > /var/www/html/index.html