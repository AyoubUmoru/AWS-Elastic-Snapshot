#!/bin/bash

set -e

BASEDIR=$(dirname "$0")

for TEMPLATE in $(find ${BASEDIR}/cf-templates/ -name '*.yaml')
do
    echo "Validating ${TEMPLATE}"
    aws cloudformation validate-template --template-body file://${TEMPLATE} > /dev/null
done