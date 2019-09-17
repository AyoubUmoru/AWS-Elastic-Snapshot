import boto3
import requests
from botocore.credentials import get_credentials
from botocore.session import Session
from requests_aws4auth import AWS4Auth

host = 'EDITME with slash ->/'
region = 'us-east-1'
service = 'es'
bucket = 'EDITME'
role_arn = 'EDITME'

creds = get_credentials(Session())

awsauth = AWS4Auth(creds.access_key, creds.secret_key, region, service)

path = '_snapshot/essnapshot'
url = host + path

payload = {
    "type": "s3",
    "settings": {
        "bucket": bucket,
        "region": region,
        "role_arn": role_arn
    }
}

headers = {"Content-Type": "application/json"}

r = requests.put(url, auth=awsauth, json=payload, headers=headers)

print(r.status_code)
print(r.text)