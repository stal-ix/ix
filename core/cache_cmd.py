import os
import io
import hashlib


@cu.singleton
def client():
    import boto3

    session = boto3.session.Session()

    return session.client(service_name='s3', endpoint_url='https://storage.yandexcloud.net')


def list_cache():
    for key in client().list_objects(Bucket='mix-cache')['Contents']:
        yield os.path.basename(key['Key'])


def store_cache(data, key):
    client().upload_fileobj(io.BytesIO(data), 'mix-cache', 'cache/' + key)


def data_md5(data):
    return hashlib.md5(data).hexdigest()
