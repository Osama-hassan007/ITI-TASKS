#Lambda Function to be triggered when uploading a file into a source s3 bucket and copy it to another target s3 bucket.
import boto3
import json

s3 = boto3.resource('s3')

def lambda_handler (event, context):
 bucket = s3.Bucket('sourcebucket-khalid')
 dest_bucket=s3.Bucket('targetbucket-khalid')

 print(dest_bucket)
 print(bucket)
 
 for obj in bucket.objects.filter(Prefix=''):
  dest_key=obj.key
  print(dest_key)
  print('copy file ' + dest_key)
  s3.Object(dest_bucket.name, dest_key).copy_from(CopySource= {'Bucket': obj.bucket_name, 'Key': obj.key})