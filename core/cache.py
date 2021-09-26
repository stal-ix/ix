import os
import io
import shutil
import tarfile

import core.utils as cu
import core.shell_cmd as cs


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


def compress_dir(d):
    res = io.BytesIO()

    with tarfile.open(mode='w:xz', fileobj=res) as tf:
        for x in os.listdir(d):
            tf.add(os.path.join(d, x), x)

    return res.getvalue()


def path_hash(d):
    return cu.struct_hash([1, d])


def store_dir(d):
    store_cache(compress_dir(d), path_hash(d))


def restore_dir(d):
    try:
        shutil.rmtree(d)
    except Exception:
        pass

    os.makedirs(d)

    data = cs.fetch_url_data(f'https://storage.yandexcloud.net/mix-cache/cache/{path_hash(d)}')

    with tarfile.open(fileobj=io.BytesIO(data)) as tf:
        tf.extractall(d)
