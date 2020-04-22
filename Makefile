.PHONY: \
	build \
	up down ps \
	login login-master login-worker-1 login-worker-2

build:
	docker-compose -f compose/compose.yml build

up:
	docker-compose -f compose/compose.yml up --d

down:
	docker-compose -f compose/compose.yml down

ps:
	docker-compose -f compose/compose.yml ps

login:
	ssh root@localhost -p $(PORT) -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no

login-master:
	PORT=2200 make login

login-worker-1:
	PORT=2201 make login

login-worker-2:
	PORT=2202 make login
