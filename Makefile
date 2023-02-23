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

wp :
	docker build -t wordpress srcs/requirements/wordpress/
	srcs/requirements/wordpress/run.sh
	docker container rm wordpress

db :
	docker build -t mariadb srcs/requirements/mariadb/
	docker container rm mariadb

rm :
	@docker container rm nginx wordpress mariadb

clean :
	sudo docker-compose -f srcs/docker-compose.yml down --remove-orphans --rmi all --volumes
	$(docker rm ${docker ps -aq})

fclean : clean
	rm -rf ${HOME}/data
	docker network prune -f
	docker volume prune -f
	docker system prune -af
	$(docker rmi ${docker images -aq})
	#rm -f $(SET_DOMAIN)
re: fclean all
