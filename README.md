# README

Stand-alone project for manual AWS Elasitc Search Snapshot and restore
Tested with AWS ES 6.3-7.1

## Prerequisite 

* Change default parameters in parameters/dev.json
* Switch into your dev account / dev role
* Execute ./validate.sh in order to validate the CF template
* Execute ./deploystack.sh dev to roll out infrastructure for dev

## Start 
* Register a Snapshot S3 repository
* Edit the environment specific parameters inside register-snap-es.py
python3 register-snap-es.py

* Take a snpashot 
curl -XPUT 'https://vpc-YOURCLUSTER.us-east-1.es.amazonaws.com/_snapshot/essnapshot/NAME_OF_THE_SNAPSHOT'

* Restore a snapshot (make sure all target inizies have been either renamed or deleted)
Note: We skip restoring the .kibana index

curl -XPOST 'https://vpc-YOURCLUSTER.us-east-1.es.amazonaws.com/_snapshot/essnapshot/NAME_OF_THE_SNAPSHOT/_restore' -d '{"indices": "*,-.kibana"}' -H 'Content-Type: application/json'$