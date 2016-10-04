THISDIR  := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))
DATABASE := shorl

default: usage

up:
	(cd $(THISDIR)/docker && docker-compose up -d)

down:
	(cd $(THISDIR)/docker && docker-compose down)

restart:
	(cd $(THISDIR)/docker && docker-compose restart)

ps:
	(cd $(THISDIR)/docker && docker-compose ps)

log:
	(cd $(THISDIR)/docker && docker-compose logs)

ssh-pg:
	(cd $(THISDIR)/docker && docker-compose exec --user postgres pg /bin/bash)

psql:
	(cd $(THISDIR)/docker && docker-compose exec --user postgres pg /bin/bash -c 'psql -Upg  -d$(DATABASE)')

redis:
	(cd $(THISDIR)/docker && docker-compose exec redis /bin/bash -c 'redis-cli')

usage:
	@echo "Usage:"
	@echo "make [up|down|restart|ps|log|ssh-pg|psql|redis]"

define HELP_TEXT
help    : Show this text
up      : Run docker-compse as daemon
down    : Terminate all docker containers run by docker-compose
restart : Restart docker-compose containers
ps      : Print out ps for dcker-compose containers
log     : Print out the logs of docker-compose containers
ssh-pg  : Get inside of pg container
psql    : Run psql
redis   : Run redis-cli
usage   : Show simple usage
endef

help:
	@: $(info $(HELP_TEXT))
