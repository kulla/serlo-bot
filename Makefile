ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

.PHONY: down help jupyter test up

down:
	docker-compose down

help:
	@echo "Usage: make [command]"
	@echo ""
	@echo "down               – Stop local MySQL server"
	@echo "help               – Show this help"
	@echo "jupyter            – Start jupyter notebook"
	@echo "jupyter-with-mysql – Start jupyter notebook with local MySQL server"
	@echo "test               – Run all unit and integration tests"
	@echo "up                 – Start local MySQL server"

jupyter-with-mysql:
	make up
	make jupyter

jupyter:
	PYTHONPATH="$(ROOT_DIR)" jupyter notebook --notebook-dir=notebooks

test:
	pytest

up:
	./start_mysql.sh
