#!/bin/bash
yum update -y
yum install httpd* -y
systemctl start httpd
systemctl start httpd
echo "hello Sai from Saidemy" > /var/www/html/index.html