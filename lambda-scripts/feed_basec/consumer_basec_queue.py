from __future__ import print_function
import boto3
import requests
from requests_aws4auth import AWS4Auth


def send_signed(method, url, service='es', region='us-east-1', body=None):
    try:
        credentials = boto3.Session().get_credentials()
        auth = AWS4Auth(credentials.access_key, credentials.secret_key, region, service, session_token=credentials.token)

        fn = getattr(requests, method)
        if body and not body.endswith("\n"):
            body += "\n"
        result = fn(url, auth=auth, data=body, headers={"Content-Type": "application/json"})
        print(result.text)
    except Exception as error:
        print(error)


def handler(event, context):
    print('Starting my lambda python')

    url = 'https://search-challenge-tzmrlhv2uxu3u27atrvo5mxf2u.us-east-1.es.amazonaws.com/challenge/_doc/'

    for record in event['Records']:
        payload = record["body"]
        print("Payload: ", str(payload))
        send_signed('post', url, body=payload)

    print('Done')
