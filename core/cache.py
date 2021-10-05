import os
import io
import minio
import shutil
import tarfile
import urllib3

import core.utils as cu
import core.shell_cmd as cs


@cu.singleton
def client():
    pool = urllib3.PoolManager(
        timeout=urllib3.util.Timeout(connect=1000, read=1000),
        cert_reqs='CERT_NONE',
        maxsize=10,
        retries=urllib3.Retry(
            total=5,
            backoff_factor=0.2,
            status_forcelist=[500, 502, 503, 504]
        )
    )

    return minio.Minio('storage.yandexcloud.net', access_key=os.environ['AWS_ACCESS_KEY_ID'], secret_key=os.environ['AWS_SECRET_ACCESS_KEY'], http_client=pool)


def store_cache(data, key):
    client().put_object('mix-cache', f'cache/{key}', io.BytesIO(data), len(data))


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
