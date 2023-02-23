NAME = inception
CONF = ./srcs/docker-compose.yml

all : $(NAME)

$(NAME) :
	docker-compose -f $(CONF) up --build -d

stop:
	docker-compose -f $(CONF) down

restart:
	docker-compose -f $(CONF) restart

nginx :
	docker build -t nginx srcs/requirements/nginx/
	srcs/requirements/nginx/run.sh
	docker container rm nginx

clean :
	sudo docker-compose -f srcs/docker-compose.yml down --remove-orphans --rmi all --volumes
	$(docker rm ${docker ps -aq})

fclean : clean
	rm -rf ${HOME}/data
	docker network prune -f
	docker volume prune -f
	docker system prune -af
	$(docker rmi ${docker images -aq})
re: fclean all
