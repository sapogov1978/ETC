# **************************************************************************** #
#                                                                              #
#    Makefile                                                                  #
#                                                                              #
#    By: Konstantin Sapogov for Trace Labs task                                #
#                                                                              #
# **************************************************************************** #

.PHONY:	all clean fclean re rebuild modelchange

CONTAINERS := docker ps -a
IMAGES := docker images -a -q
NETWORK = django_app

all:
	@sudo docker-compose run web django-admin startproject TraceLabsTest .
	@sudo chown -R $$USER:$$USER TraceLabsTest data manage.py
	@rm -rf TraceLabsTest/*
	@cp -r project_settings/* TraceLabsTest/
	
	@sudo docker-compose run web python manage.py startapp eth_crawler
	@sudo chown -R $$USER:$$USER eth_crawler
	@-rm -rf eth_crawler/*
	@cp -r app_settings/* eth_crawler/
	
	@sudo docker-compose run web python manage.py makemigrations
	@sudo docker-compose run web python manage.py migrate

	@docker-compose up
	
rebuild:
	@-sudo rm -rf TraceLabsTest
#	@-sudo rm -rf data
	@-sudo rm -f manage.py
	@-sudo rm -rf eth_crawler
	
modelchange:
	-docker-compose -f down --remove-orphans
	-docker stop $$($(CONTAINERS))
	@sudo docker-compose run web python manage.py makemigrations
	@sudo docker-compose run web python manage.py migrate
	@docker-compose up


clean:
	-docker-compose -f down --remove-orphans
	-docker stop $$($(CONTAINERS))
	-docker rm -f $$($(CONTAINERS))

fclean: clean
	-docker volume rm $$(docker volume ls -q)
	-docker system prune -af --volumes
	-docker network rm $$(docker network ls -q)
	-docker rmi -f $$($(IMAGES))
	-sudo rm -rf TraceLabsTest
	-sudo rm -rf data
	-sudo rm -f manage.py
	-sudo rm -rf eth_crawler

re: fclean all
