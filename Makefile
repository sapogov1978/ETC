# **************************************************************************** #
#                                                                              #
#    Makefile                                                                  #
#                                                                              #
#    By: Konstantin Sapogov for Trace Labs task                                #
#                                                                              #
# **************************************************************************** #

.PHONY:	all clean fclean re

CONTAINERS := docker ps -a
IMAGES := docker images -q
NETWORK = mandatory

all:
	docker-compose -f ./docker_files/docker-compose.yml up -d --build

clean:
	-docker-compose -f ./docker_files/docker-compose.yml down --remove-orphans
	-docker stop $$($(CONTAINERS))
	-docker rm -f $$($(CONTAINERS))

fclean: clean
	-docker volume rm $$(docker volume ls -q)
	-docker system prune -af --volumes
	-docker network rm $$(docker network ls -q)
	-docker rmi -f $$($(IMAGES))

re: fclean all
