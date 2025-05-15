COMPOSE = docker compose -f srcs/docker-compose.yml
DATA_DIR = /home/facetint/data
WP_DATA = $(DATA_DIR)/wordpress
DB_DATA = $(DATA_DIR)/mariadb

.PHONY: all setup_dirs build up down restart logs prune clean rebuild

all: build up

setup_dirs:
	mkdir -p $(WP_DATA)
	mkdir -p $(DB_DATA)

build: setup_dirs
	$(COMPOSE) build

up: setup_dirs
	$(COMPOSE) up -d

down:
	$(COMPOSE) down

restart: down up

logs:
	$(COMPOSE) logs -f

prune:
	docker system prune -f
	docker volume prune -f
	docker network prune -f
	docker image prune -f

clean: down
	rm -rf $(WP_DATA)/*
	rm -rf $(DB_DATA)/*

rebuild: clean build up
