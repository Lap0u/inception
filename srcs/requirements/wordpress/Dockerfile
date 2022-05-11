FROM debian:buster

LABEL maintainer="cbeaurai cbeaurai@student.42.fr"

EXPOSE 9000

RUN	apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y php7.3 php-mysqli php-fpm wget

COPY ./wp_setup.sh ./var/www/
COPY ./wp-config.php ./var/www/
COPY ./www.conf /etc/php/7.3/fpm/pool.d

RUN chmod +x /var/www/wp_setup.sh

ENTRYPOINT [ "/var/www/wp_setup.sh" ]

CMD ["php-fpm7.3", "-F", "-R"]