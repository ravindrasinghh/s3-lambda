import boto3
import csv
s3_client = boto3.client("s3")

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('employee')

def lambda_handler(event, context):
    bucket_name = event['Records'][0]['s3']['bucket']['name']
    s3_file_name = event['Records'][0]['s3']['object']['key']
    resp = s3_client.get_object(Bucket=bucket_name,Key=s3_file_name)
    data = resp['Body'].read().decode("utf-8")
    employees = data.split("\n")
    for emp in employees:
        print(emp)
    #     emp_data = emp.split(",")
    # #added to dynamodb
    #     table.put_item(
    #         Item = {
    #             "id" : emp_data[0],
    #             "name" : emp_data[1],
    #             "location" : emp_data[2]
    #         }
    #     )        