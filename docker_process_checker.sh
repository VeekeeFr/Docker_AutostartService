#!/bin/sh

SCRIPTPATH=`dirname $0`

function checkContainer
{
	echo "Processing docker container '${1}'"
	HAS_CONTAINER=`docker ps -a | grep "${1}" | wc -l`
	if [ ${HAS_CONTAINER} -eq 1 ]
	then
		IS_RUNNING=`docker ps -a | grep "${1}" | grep "Up " | wc -l`
		if [ ${IS_RUNNING} -eq 0 ]
		then
			echo "	Restarting container ${1}"
			docker start ${1}
		else
			echo "	Container ${1} is still running"
		fi
	else
		if [ ${HAS_CONTAINER} -eq 0 ]
		then
			echo "	ERROR: No container found!"
		else
			echo "	ERROR: Multiple containers found!"
		fi
	fi
}

{
	while true
	do
		while read container
		do
			checkContainer "${container}"
		done < ${SCRIPTPATH}/docker_env.list
		sleep 600
	done
} | tee ${SCRIPTPATH}/service.log
