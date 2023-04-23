#!/bin/bash

# Define variables
Mail_Recipient="administrator@DOMAIN.EXTENSION"
Mail_Subject="VPS Login Alert"

mail --subject="$Mail_Subject" "$Mail_Recipient" --content-type="text/plain" <<EOF
##################################################
#                                                #
#       Server Terminal Login Notification       #
#                                                #
##################################################

Hostname   : $(hostname)
User       : $(last --fullnames | awk '{print $1}' | head -n 1)
IP Address : $(last --fullnames | awk '{print $3}' | head -n 1)

##################################################
EOF
