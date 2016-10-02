#!/bin/bash

SCRIPT_DIR=${0%/*}

case $1 in
	up|start)
		(cd $SCRIPT_DIR/docker && docker-compose up -d)
		;;
	down|stop)
		(cd $SCRIPT_DIR/docker && docker-compose down)
		;;
	upndown|restart)
		(cd $SCRIPT_DIR/docker && docker-compose restart)
		;;
	ssh-pg)
		(cd $SCRIPT_DIR/docker && docker-compose exec --user postgres pg /bin/bash)
		;;
	psql)
		(cd $SCRIPT_DIR/docker && docker-compose exec --user postgres pg /bin/bash -c 'psql -Upg  -dshorl')
		;;
	redis)
		(cd $SCRIPT_DIR/docker && docker-compose exec redis /bin/bash -c 'redis-cli')
		;;
	*)
		{
			echo "unknow command"
			echo "usage:"
			echo "$0 [up|down|restart|ssh-pg|psql|redis]"
		} 1>&2
		;;
esac
