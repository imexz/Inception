SRC_PATH=./srcs/

all: fclean setup up 

setup:
	@chmod +x $(SRC_PATH)/setup.sh
	@cd $(SRC_PATH)/ && sudo -E ./setup.sh

up:
	@cd $(SRC_PATH) && docker-compose up -d;

down:
	@cd $(SRC_PATH) && docker-compose down -v --rmi all --remove-orphans

clean: down
	@cd $(SRC_PATH) && docker system prune -f

fclean: clean
	@sudo rm -rf $(HOME)/data/mysql/* $(HOME)/data/www/*

.PHONY: all setup up down clean fclean