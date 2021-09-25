import os
import io
import hashlib

import core.utils as cu
import core.manager as cm
import core.cmd_line as cc
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


def data_md5(data):
    return hashlib.md5(data).hexdigest()


def cli_cache_all(ctx):
    def iter_urls():
        for p in cm.Manager(cc.config_from(ctx)).all_packages():
            yield from p.urls

    in_cache = set(list_cache())

    for el in iter_urls():
        print(f'process {el["url"]}')

        if 'md5' not in el:
            print(f'no md5 in {el}, skip')

            continue

        md5 = el['md5']

        if md5 in in_cache:
            continue

        url = el['url']
        data = cs.fetch_url_data(url)

        if data_md5(data) != md5:
            print(f'incorrect md5 in {el}, skip')

            continue

        store_cache(data, 'src/' + md5)

        in_cache.add(md5)


def cli_cache_url(ctx):
    in_cache = set(list_cache())

    for url in ctx['args']:
        data = cs.fetch_url_data(url)
        md5 = data_md5(data)

        print(f'{md5} {url}')

        if md5 in in_cache:
            print(f'skip {url}')

            continue

        store_cache(data, 'src/' + md5)

        in_cache.add(md5)


def cli_cache_upload(ctx):
    a = ctx['args']

    with open(a[0], 'rb') as f:
        store_cache(f.read(), a[1])
