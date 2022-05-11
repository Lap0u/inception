#!/bin/bash

#mariadb setup

service mysql start

echo "CREATE DATABASE IF NOT EXISTS wordpress;" | mysql -u root
echo "CREATE USER IF NOT EXISTS 'user42' @'%' IDENTIFIED BY 'root'" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'user42'@'%' WITH GRANT OPTION" | mysql -u root
echo "FLUSH PRIVILEGES" | mysql -u root
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'rootpw'" | mysql -u root -p'rootpw'

exec "$@"