#!/bin/bash
sudo apt-get update
sudo apt-get install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx 
 
 echo "<h1>This is my auto-installed nginx by Terraform</h1>" > /var/www/html/index.html