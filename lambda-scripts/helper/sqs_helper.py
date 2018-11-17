import boto3


def send_sqs_data(queuename, data):
    sqs = boto3.resource('sqs')
    queue = sqs.get_queue_by_name(QueueName=queuename)
    queue.send_message(MessageBody=data)


def receive_sqs_data(queuename):
    sqs = boto3.resource('sqs')
    queue = sqs.get_queue_by_name(QueueName=queuename)
    return queue.receive_messages()
