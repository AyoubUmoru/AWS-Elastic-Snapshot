#!/bin/bash

set -e

if [ -z "$1" ]
then
    echo "No parameter given...exiting"
    exit
fi
if [ ! -f "parameters/${1}.json" ]; then
    echo "No configuration file found for environment ${1}   ...exiting"
    exit
fi

BASEDIR=$(dirname "$0")
ENVIRON=$1
. ${BASEDIR}/parameters/config

echo "Initiating for ${ENVIRON}"
${BASEDIR}/validate.sh
bundle exec autostacker24 update --stack ${PRODUCT} --template cf-templates/es.yaml --params ${BASEDIR}/parameters/${ENVIRON}.json