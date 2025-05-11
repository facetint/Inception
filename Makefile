all : build up

up:
	docker-compose -f srcs/docker-compose.yml up -d

build:
	docker-compose -f srcs/docker-compose.yml build

down:
	docker-compose -f srcs/docker-compose.yml down

ps:
	docker-compose -f srcs/docker-compose.yml ps

clean:
	docker-compose -f srcs/docker-compose.yml down -v --remove-orphans
	docker system prune -af --volumes

rebuild: down build up