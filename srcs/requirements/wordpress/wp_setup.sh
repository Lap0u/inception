#!/bin/bash

	sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf";
	chown -R www-data:www-data /var/www/*;
	chown -R 755 /var/www/*;
	mkdir -p /run/php/;

	mkdir -p /var/www/html
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
	chmod +x wp-cli.phar; 
	mv wp-cli.phar /usr/local/bin/wp;
	cd /var/www/html;
	wp core download --allow-root;
	wp core install --allow-root --url=${WP_URL} --title=${MYSQL_DB_NAME} --admin_user=${WP_ADM_LOG} --admin_password=${WP_ADM_PWD}  --admin_email=${WP_ADM_MAIL}
	wp user create --allow-root ${WP_USER_LOG} ${WP_USER_MAIL} --user_pass=${WP_USER_PWD};
	wp theme install spacious --activate --allow-root

exec "$@"