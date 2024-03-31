#!/bin/bash

sudo apt-get update

sudo apt install nginx-core -y

sudo systemctl start nginx

mkdir data

mkdir public_html

mkdir public_html/application1

touch public_html/index.html

touch public_html/application1/app1.html

echo "sample text" > public_html/application1/app1.html 

sudo touch /etc/nginx/conf.d/server1.conf

#curl -o mr.fresh.png https://static.wikia.nocookie.net/silly-cat/images/4/4d/Mr._Fresh.png

sudo nginx -s reload

###I found that under /etc/nginx/sites-enabled there was a default file that was acting as a .conf file,
### instead of there being one under /etc/nginx/conf.d. Removing this default file, like the comments inside of it mentions, fixed my issue.
###