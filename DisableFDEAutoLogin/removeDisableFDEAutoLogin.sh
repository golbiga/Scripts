#!/bin/bash

osvers=$(sw_vers -productVersion | awk -F. '{print $2}')
FDEAUTOLOGIN=`defaults read /Library/Preferences/com.apple.loginwindow DisableFDEAutoLogin 2>/dev/null`


if [[ ${osvers} -ge 7 ]]; then
	if [ "$FDEAUTOLOGIN" != "" ]; then
		echo "DisableFDEAutoLogin is set. Removing DisableFDEAutoLogin."
		defaults delete /Library/Preferences/com.apple.loginwindow DisableFDEAutoLogin
	else
		echo "DisableFDEAutoLogin is not set"
	fi
fi

exit 0