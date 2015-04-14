#!/bin/bash

if [ -d /usr/local ]; then
	filecount=$(/usr/bin/find /usr/local | wc -l | sed 's/ //g')
fi

echo "<result>$filecount</result>"	