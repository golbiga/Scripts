#!/bin/sh

os=`sw_vers -productVersion | awk -F. '{print $1 "." $2}'`

sudo rm -rf "/Applications/Microsoft Communicator.app"
sudo rm -rf "/Applications/Microsoft Messenger.app"
sudo rm -rf "/Applications/Microsoft Office 2011"
sudo rm -rf "/Applications/Remote Desktop Connection.app"
sudo rm -rf "/Library/Fonts/Microsoft"
sudo rm -rf "/Library/Internet Plug-Ins/OfficeLiveBrowserPlugin.plugin"
sudo rm -rf "/Library/Application Support/Microsoft/Communicator"
sudo rm -rf "/Library/Application Support/Microsoft/MAU2.0"
sudo rm -rf "/Library/Application Support/Microsoft/MERP2.0"
sudo rm "/Library/Preferences/com.microsoft.office.licensing.plist"
sudo rm "/Library/LaunchDaemons/com.microsoft.office.licensing.helper.plist"
sudo rm "/Library/PrivilegedHelperTools/com.microsoft.office.licensing.helper"


if [ $os = "10.6" ] || [ $os = "10.7" ]
	then rm -f "/var/db/receipts/com.microsoft.office*" "/var/db/receipts/com.microsoft.oc*" "/var/db/receipts/com.microsoft.mau*" "/var/db/receipts/com.microsoft.merp*"
		else
if [ $os = "10.5" ]
	then rm -rf "/Library/Receipts/Office2011_en_*"
fi
fi
