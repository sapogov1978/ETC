# **************************************************************************** #
#                                                                              #
#    Makefile                                                                  #
#                                                                              #
#    By: Konstantin Sapogov for Trace Labs task                                #
#                                                                              #
# **************************************************************************** #

.PHONY:	all clean fclean re rebuild

CONTAINERS := docker ps -a
IMAGES := docker images -q
NETWORK = mandatory

all:
	sudo docker-compose run web django-admin startproject TraceLabsTest .
	sudo chown -R $$USER:$$USER TraceLabsTest manage.py
	rm -f TraceLabsTest/settings.py
	cp correct_settings.py TraceLabsTest/settings.py
	sudo docker-compose run web python manage.py startapp eth_crawler
	sudo chown -R $$USER:$$USER eth_crawler
	-rm -f TraceLabsTest/urls.py
	cp crawler/project_url.py TraceLabsTest/urls.py
	-rm rf eth_crawler/*
	cp -r crawler/* eth_crawler/
	-rm -f eth_crawler/project_url.py
	
	docker-compose up
	
# docker-compose -f ./docker_files/docker-compose.yml up -d --build

rebuild:
	-sudo rm -rf TraceLabsTest
#	-sudo rm -rf data
	-sudo rm -f manage.py
	-sudo rm -rf eth_crawler

clean:
	-docker-compose -f down --remove-orphans
	-docker stop $$($(CONTAINERS))
	-docker rm -f $$($(CONTAINERS))

fclean: clean
	-docker volume rm $$(docker volume ls -q)
	-docker system prune -af --volumes
	-docker network rm $$(docker network ls -q)
	-docker rmi -f $$($(IMAGES))

re: fclean all
