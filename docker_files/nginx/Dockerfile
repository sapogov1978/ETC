# **************************************************************************** #
#                                                                              #
#    Nginx                                                                     #
#                                                                              #
#    By: Konstantin Sapogov for Trace Labs task                                #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && \
	apt-get -y install nginx && \
	#apt-get -y install openssl &&\
	#mkdir -p /etc/nginx/ssl &&\
	mkdir -p /var/run/nginx
	#openssl req -x509 -nodes -newkey rsa:2048 -sha256 -out /etc/nginx/ssl/local.pem -keyout /etc/nginx/ssl/local.key -subj "/C=RS/ST=Vojvodina/L=Novi_Sad/O=Konstantin_Sapogov/CN=localhost/emailAddress=sapogov@gmail.com"

COPY default.conf /etc/nginx/conf.d/default.conf
COPY /crawler/index.html /var/www/html/index.html

EXPOSE 80 
#443
ENTRYPOINT ["nginx", "-g", "daemon off;"]
