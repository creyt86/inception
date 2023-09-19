-include srcs/.env

up:
	@mkdir -p ${HOME}/data/website
	@mkdir -p ${HOME}/data/database
	@docker compose -f srcs/docker-compose.yml up --detach
	@#open http://${LOGIN}.42.ch
	@#xinit /absolute/path/to/firefox

down:
	@docker compose -f srcs/docker-compose.yml down -v --remove-orphans

rm:
	@docker compose -f srcs/docker-compose.yml down -v --remove-orphans --rmi all
	@docker system prune -af
	@docker volume prune -f
	@rm -rf ${HOME}/data/website
	@rm -rf ${HOME}/data/database

re: down
	@rm -rf ${HOME}/data/website
	@rm -rf ${HOME}/data/database
	@mkdir -p ${HOME}/data/website
	@mkdir -p ${HOME}/data/database
	@docker compose -f srcs/docker-compose.yml up --detach --build

rre: rm up