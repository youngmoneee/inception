NAME = inception
CONF = ./srcs/docker-compose.yml

all : $(NAME)

$(NAME) :
	docker-compose -f $(CONF) up

stop:
	docker-compose -f $(CONF) down

clean : stop

	
fclean : clean
	docker system prune -af

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
	srcs/requirements/mariadb/run.sh
	docker container rm mariadb

rm :
	@docker container rm nginx wordpress mariadb
