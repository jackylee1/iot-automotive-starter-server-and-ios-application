#!/bin/bash
# Information steps:
# 1) chmod u+x bm-restage-and-log.sh
# 2) ./bm-restage-and-log.sh
# cf api https://api.eu-gb.bluemix.net UK
# cf api https://api.ng.bluemix.net US

user="<bluemix-id>"
# bluemix_api="https://api.eu-gb.bluemix.net"
bluemix_api="https://api.ng.bluemix.net"
organization_name="<bluemix-organization-name>"
space_name="<bluemix-space-name>"
application_name="<bluemix-application-name>"

echo "*****************************************************"
echo "--> Start Restage and ensure to deploy into the right bluemix region"
echo "Insert your password:"
# How to input a password in bash shell
# http://stackoverflow.com/questions/3980668/how-to-get-a-password-from-a-shell-script-without-echoing
read -s password
cd ..
cf login -a $bluemix_api -u $user -p $password -o $organization_name -s $space_name

echo "--> Starting push and log CF $application_name"

echo "****** show existing apps *********"
cf apps
echo "******* push to CF ********"
cf restage  $application_name
echo "******* start CF logging ********"
cf logs  $application_name
echo "-> DONE!"
echo "*****************************************************"
