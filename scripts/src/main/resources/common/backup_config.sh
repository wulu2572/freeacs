#!/bin/bash

declare -a moduleNames=(core stun syslog shell monitor web webservice tr069)

for module in ${moduleNames[@]} ; do
    echo "Dont mind the warnings below, this script is trying to backup two types of property files."
    echo "Only one type of property file exists in each module"
    config_loc=/opt/freeacs-${module}/config
    config_name=application-config
    # backup .conf file
    cp ${config_loc}/${config_name}.conf ${config_loc}/${config_name}.conf.$(date +%Y%m%d%H%M) || :
    # backup .properties file
    cp ${config_loc}/${config_name}.properties ${config_loc}/${config_name}.properties.$(date +%Y%m%d%H%M) || :
done