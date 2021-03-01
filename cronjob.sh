#!/bin/bash
if [[ ! "$(/usr/sbin/service nym-mixnode status)" =~ "start/running" ]]
then
    /usr/sbin/service nym-mixnode start
fi

for(( i=1; i <=50; i++ ))
do
	mix='nym-mixnode'
	nymmixnode=${mix}${i}
	if [[ ! "$(/usr/sbin/service ${nymmixnode} status)" =~ "start/running" ]]
	then
		/usr/sbin/service ${nymmixnode} start
	fi	
done
