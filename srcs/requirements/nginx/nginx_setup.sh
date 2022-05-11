#!/bin/bash

#base folder

mkdir /var/www/html/inception

#autosigned certificates

mkdir /etc/nginx/ssl
openssl req -x509 -sha256 -nodes -newkey rsa:2048 -days 365 -keyout inception.key -out inception.crt -subj "/C=FR/ST=Paris/L=Paris/O=42 paris/OU=inception/CN=cbeaurai/emailAddress=cbeaurai@student.42.fr"
mv inception.key /etc/nginx/ssl && mv inception.crt /etc/nginx/ssl

#nginx setup

mv ./tmp/nginx-conf /etc/nginx/sites-available/inception
ln -s /etc/nginx/sites-available/inception /etc/nginx/sites-enabled/inception
rm -rf /etc/nginx/sites-enabled/default && rm -rf /etc/nginx/sites-available/default

cp /tmp/* /var/www/html/


nginx -t

exec "$@"
