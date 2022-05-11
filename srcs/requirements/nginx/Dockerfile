FROM debian:buster

LABEL maintainer="cbeaurai cbeaurai@student.42.fr"

EXPOSE 443

RUN	apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y nginx \
	&& apt-get install -y openssl

COPY ./nginx_setup.sh ./var/www
COPY ./nginx-conf ./tmp/
COPY ./static/* ./tmp/


RUN chmod +x var/www/nginx_setup.sh

ENTRYPOINT [ "/var/www/nginx_setup.sh" ]

CMD ["nginx", "-g", "daemon off;"]