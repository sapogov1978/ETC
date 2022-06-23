# **************************************************************************** #
#                                                                              #
#    Dockerfile                                                                #
#                                                                              #
#    By: Konstantin Sapogov for Trace Labs task                                #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

#apt-get -y upgrade && \
#apt-get -y --no-install-suggests install wget && \

RUN apt-get update &&\
    apt-get -y install openssl &&\
    apt-get -y install nginx &&\
    apt-get -y install mariadb-server

COPY srcs/docker_files/server.conf /etc/nginx/conf.d/server.conf

#RUN apt-get -y install php-cli php-fpm php-cgi php-mysql php-mbstring

EXPOSE 80 443

COPY docker_files/start.sh ./
RUN chmod 777 start.sh
CMD bash start.sh