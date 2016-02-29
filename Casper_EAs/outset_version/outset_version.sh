#!/bin/bash

osvers=$(sw_vers -productVersion | awk -F. '{print $2}')

if [[ ${osvers} -lt 9 ]]; then
	echo "<result>Outset Not Compatible</result>"
fi

if [ -d /usr/local/outset ]; then
	version=`/usr/local/outset/outset --version`
	
	if [[ $version != "" ]]; then
		echo "<result>$version</result>"
	else
		echo "<result>Outset 1.x Installed</result>"
	fi
	
else
	echo "<result>Outset Not Installed</result>"
fi