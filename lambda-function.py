#Lambda Function to copy a file into s3 bucket.
import json, boto3,os, sys, uuid
from urllib.parse import unquote_plus

s3_client = boto3.client('s3')

def lambda_handler(event, context):
    some_text = "test"
    #put the bucket name you create in step 1
    bucket_name = "targetbucket-osama"
    file_name = "my_test_file.txt"
    lambda_path = "/tmp/" + file_name
    s3_path = "output/" + file_name
    os.system('echo testing... >'+lambda_path)
    s3 = boto3.resource("s3")
    s3.meta.client.upload_file(lambda_path, bucket_name, file_name)

    return {
        'statusCode': 200,
        'body': json.dumps('file is created in:'+s3_path)
    }