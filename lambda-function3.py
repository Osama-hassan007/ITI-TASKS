#function to copy a file from s3 bucket to a Dynamodb table
#importing packages
import json
import boto3

def lambda_handler(event,context):
    
    dynamodb = boto3.resource('dynamodb')
    s3 = boto3.resource('s3')
    bucket = s3.Bucket('bucket-139')
    #table name
    table = dynamodb.Table('s3-files')
   
    for obj in bucket.objects.all():
        response = table.put_item(
        Item={
                
                'fileName': obj.key,
                
            }
        )
       
    return response