.PHONY: \
	build \
	up down ps \
	login login-master login-worker-1 login-worker-2 \
	ping

COMPOSE:=docker-compose --file compose/compose.yml
ANSIBLE:=$(COMPOSE) run --rm --workdir /work/ansible ansible

build:
	$(COMPOSE) build

up:
	$(COMPOSE) up --detach

down:
	$(COMPOSE) down

ps:
	$(COMPOSE) ps

login:
	ssh ubuntu@localhost -p $(PORT) -i compose/id_rsa -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no

login-master:
	PORT=2200 make login

login-worker-1:
	PORT=2201 make login

login-worker-2:
	PORT=2202 make login

ping:
	$(ANSIBLE) ansible all \
		--inventory-file=inventory.ini \
		--module-name ping
