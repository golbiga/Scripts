#!/bin/bash

osvers=$(sw_vers -productVersion | awk -F. '{print $2}')
DISABLEFDEAUTOLOGIN=`defaults read /Library/Preferences/com.apple.loginwindow DisableFDEAutoLogin 2>/dev/null`


if [[ ${osvers} -ge 7 ]]; then
	if [ "$DISABLEFDEAUTOLOGIN" = "1" ]; then
		echo "Automatic login is disabled. Removing DisableFDEAutoLogin."
		defaults delete /Library/Preferences/com.apple.loginwindow DisableFDEAutoLogin
	else
		echo "Automatic login is not disabled."
	fi
fi

exit 0