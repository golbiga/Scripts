#!/bin/bash

CheckSiteNetwork (){

  #  CheckSiteNetwork function adapted from Facebook's check_corp function script.
  #  check_corp script available on Facebook's IT-CPE Github repo:
  #
  # check_corp:
  #   This script verifies a system is on the corporate network.
  #   Input: CORP_URL= set this to a hostname on your corp network
  #   Optional ($1) contains a parameter that is used for testing.
  #   Output: Returns a check_corp variable that will return "True" if on 
  #   corp network, "False" otherwise.
  #   If a parameter is passed ($1), the check_corp variable will return it
  #   This is useful for testing scripts where you want to force check_corp
  #   to be either "True" or "False"
  # USAGE: 
  #   check_corp         # No parameter passed
  #   check_corp "True"  # Parameter of "True" is passed and returned
  

  site_network="False"
  ping=`host -W .5 server_name_here.domain.com`

  # If the ping fails - site_network="False"
  [[ $? -eq 0 ]] && site_network="True"

  # Check if we are using a test
  [[ -n "$1" ]] && site_network="$1"
}

CheckSiteNetwork
	
	if [[ "$site_network" == "False" ]]; then
    	echo "<result>Off-site</result>"
    fi

    if [[ "$site_network" == "True" ]]; then
    	echo "<result>On-site</result>"
    fi

    exit 0
