-include srcs/.env

up:
	@mkdir -p /home/creyt/data/wordpress-data
	@mkdir -p /home/creyt/data/mariadb-data
	@docker compose -f srcs/docker-compose.yml up --detach
	@#open http://${LOGIN}.42.fr
	@#xinit /absolute/path/to/firefox

down:
	@docker compose -f srcs/docker-compose.yml down -v --remove-orphans

rm:
	@docker compose -f srcs/docker-compose.yml down -v --remove-orphans --rmi all
	@docker system prune -af
	@docker volume prune -f
	@rm -rf /home/creyt/data/wordpress-data
	@rm -rf /home/creyt/data/mariadb-data

re: down
	@rm -rf /home/creyt/data/wordpress-data
	@rm -rf /home/creyt/data/mariadb-data
	@mkdir -p /home/creyt/data/wordpress-data
	@mkdir -p /home/creyt/data/mariadb-data
	@docker compose -f srcs/docker-compose.yml up --detach --build

rre: rm up
