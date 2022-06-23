# **************************************************************************** #
#                                                                              #
#    Dockerfile                                                                #
#                                                                              #
#    By: Konstantin Sapogov for Trace Labs task                                #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

#----- INSTALATION ------
RUN apt-get update &&\
    apt-get -y install \
    openssl \
    nginx \
    mariadb-server \
    python3-pip build-essential libssl-dev libffi-dev python3-dev \
    python3-django

#----- NGINX WEB SERVER ------
RUN mkdir -p /etc/nginx/ssl &&\
    mkdir -p /var/run/nginx/ &&\
    openssl req -x509 -nodes -newkey rsa:2048 -sha256 -out /etc/nginx/ssl/local.pem -keyout /etc/nginx/ssl/local.key -subj "/C=RS/ST=NSO/L=NoviSad/O=Konstantin_Sapogov/CN=localhost/emailAddress=sapogov@gmail.com"

COPY docker_files/server.conf /etc/nginx/conf.d/default.conf

#----- MARIADB ------
RUN service mysql start && \
	mysqladmin -u root password crawler && \
	echo "CREATE DATABASE IF NOT EXISTS crawler;" | mysql -u root -pcrawler && \
	echo "CREATE USER IF NOT EXISTS 'crawler' IDENTIFIED BY 'crawler';" | mysql -u root -pcrawler && \
	echo "GRANT ALL PRIVILEGES ON *.* TO 'crawler' IDENTIFIED BY 'crawler';" | mysql -u root -pcrawler && \
	echo "FLUSH PRIVILEGES;" | mysql -u root -pcrawler

#RUN	sed -i "s/\#port/port/" "/etc/mysql/mariadb.conf.d/50-server.cnf" && \
#    sed -i "s/bind-address/\#bind-address/" "/etc/mysql/mariadb.conf.d/50-server.cnf"

RUN chown -R www-data /var/www/* && chmod -R 755 /var/www/*

EXPOSE 80 443

COPY docker_files/start.sh ./

RUN chmod 777 start.sh
CMD bash start.sh