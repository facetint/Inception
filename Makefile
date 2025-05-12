all : build up

up:
	mkdir -p wordpress
	mkdir -p mariadb
	docker compose -f srcs/docker-compose.yml up -d

build:
	docker compose -f srcs/docker-compose.yml build

down:
	docker compose -f srcs/docker-compose.yml down

ps:
	docker compose -f srcs/docker-compose.yml ps

clean:
	docker compose -f srcs/docker-compose.yml down
	
rebuild: down build up