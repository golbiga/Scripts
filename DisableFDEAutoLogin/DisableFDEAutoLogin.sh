#!/bin/bash

osvers=$(sw_vers -productVersion | awk -F. '{print $2}')

if [[ ${osvers} -eq 7 ]]; then
	ENCRYPTION=`diskutil cs list | grep -E "Encryption Type" | sed -e's/\|//' | awk '{print $3}'`
	if [ "$ENCRYPTION" = "AES-XTS" ]; then
		echo "FileVault 2 is enabled. Disabling FDEAutoLogin."
		defaults write /Library/Preferences/com.apple.loginwindow DisableFDEAutoLogin -bool YES
	else
		echo "FileVault 2 is not enabled."
	fi
fi

if [[ ${osvers} -ge 8 ]]; then
	FDE=`fdesetup status | grep "Off"`
	if [ "$FDE" = "" ]; then
		echo "FileVault 2 is enabled. Disabling FDEAutoLogin."
		defaults write /Library/Preferences/com.apple.loginwindow DisableFDEAutoLogin -bool YES
	else
		echo "FileVault 2 is not enabled."
	fi
fi	

exit 0