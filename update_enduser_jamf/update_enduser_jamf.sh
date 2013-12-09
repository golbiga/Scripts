#!/bin/bash
# This script checks who is logged into the machine and if they are an AD user
# If the user is in AD, a recon will run and update the endUsername

# Who is logged in and what type of account is it
currentuser=`/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }'`
accounttype=`dscl . -read /Users/$currentuser | grep UniqueID | cut -c 11-`

if [[ "$currentuser" = root ]];
	then
	echo "No one is logged in, exiting."
	exit 1
else
	if (( "$accounttype" < 1000 )); then
		echo "This account is not in AD, exiting."
		exit 1
	else 
		echo "This account is in AD, lets run jamf recon."
		/usr/sbin/jamf recon -endUsername $currentuser
	fi
fi
exit 0
