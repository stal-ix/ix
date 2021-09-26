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
    # if you want uniqness for path, encode path in basename
    return cu.struct_hash([1, os.path.basename(d)])


def store_dir(d):
    k = path_hash(d)

    print(f'store {d} into {k}')

    store_cache(compress_dir(d), k)


def restore_dir(d):
    k = path_hash(d)
    u = f'https://storage.yandexcloud.net/mix-cache/cache/{k}'

    print(f'load {u} into {d}')

    try:
        shutil.rmtree(d)
    except Exception:
        pass

    os.makedirs(d)

    data = cs.fetch_url_data(u)

    with tarfile.open(fileobj=io.BytesIO(data)) as tf:
        tf.extractall(d)
