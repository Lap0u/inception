FROM debian:buster

EXPOSE 3306

LABEL maintainer="cbeaurai cbeaurai@student.42.fr"

RUN	apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y mariadb-server

COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./db_setup.sh ./tmp/

RUN chmod +x /tmp/db_setup.sh

RUN /bin/sh ./tmp/db_setup.sh

CMD ["mysqld"]