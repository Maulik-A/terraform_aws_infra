#!/bin/bash
sudo apt-get update
sudo apt-get install nginx -y
echo "Hi!" >/var/www/html/index.nginx-debian.html

