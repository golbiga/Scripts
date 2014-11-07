#!/bin/bash
# This script checks who is logged into the machine and updates username in JSS.

# Who is logged in and what type of account is it
loggedInUser=`/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }'`

if  [ $loggedInUser = "root" ]; then
	echo "No one is logged in"
	exit 1
else
	echo "Running recon for $loggedInUser `date`..."
	# Run recon, submitting the users username which as of 8.61+ can then perform an LDAP lookup
	sudo jamf recon -endUsername $loggedInUser
	echo "Finished running recon for $loggedInUser `date`..."
fi
exit 0