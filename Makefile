NAME = inception
VLOC = /home/youngpar/data
CONF = ./srcs/docker-compose.yml

all : $(NAME)

$(NAME) :
	echo "127.0.0.1 youngpar.42.fr" >> /etc/hosts
	mkdir -p $(VLOC)/wordpress $(VLOC)/db
	docker compose -f $(CONF) up --build -d
stop:
	docker compose -f $(CONF) down
restart:
	docker compose -f $(CONF) restart
clean :
	docker compose -f srcs/docker-compose.yml down --remove-orphans --rmi all --volumes
	$(docker rm ${docker ps -aq})
fclean : clean
	rm -rf $(VLOC)
	docker network prune -f
	docker volume prune -f
	docker system prune -af
	$(docker rmi ${docker images -aq})
re: fclean all
