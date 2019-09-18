# README

Stand-alone project for manual AWS Elasitcsearch snapshot and restore
* Tested with AWS ES 6.3-7.1

## Prerequisites

* Change default parameters in parameters/dev.json
* Switch into your dev account / dev role
* Execute ./validate.sh in order to validate the CF template
* Execute ./deploystack.sh dev to roll out infrastructure for dev

## Start 
1. Register a snapshot S3 repository (**edit the environment specific parameters inside register-snap-es.py**)
```bash
# Register repository

python3 register-snap-es.py
```
2. Take a snapshot - see below
```bash
# Taking a snapshot

curl -XPUT 'https://vpc-YOURCLUSTER.us-east-1.es.amazonaws.com/_snapshot/essnapshot/NAME_OF_THE_SNAPSHOT?wait_for_completion=true'
```

3. Restore a snapshot (make sure all target indicies have been either renamed or deleted - except for the .kibana)
Note: We skip restoring the .kibana index - as this makes no sense for us

```bash
# Restoring a snapshot

curl -XPOST 'https://vpc-YOURCLUSTER.us-east-1.es.amazonaws.com/_snapshot/essnapshot/NAME_OF_THE_SNAPSHOT/_restore' -d '{"indices": "*,-.kibana"}' -H 'Content-Type: application/json'

```

## Ressources

* Ressources abut upgrading ES -> [Link](https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-version-migration.html)

* Ressources about ES snapshot API-> [Link](https://www.elastic.co/guide/en/elasticsearch/reference/current/modules-snapshots.html)