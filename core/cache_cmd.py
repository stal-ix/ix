import os
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
        k = key['Key']

        if k.startswith('cache/'):
            yield k[6:]


def store_cache(path):
    client().upload_file(path, 'mix-cache', 'cache/' + os.path.basename(path))


def cli_cache(ctx):
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

        try:
            cs.fetch_url(url, md5)

            if hashlib.md5(open(md5, 'rb').read()).hexdigest() != md5:
                print(f'incorrect md5 in {el}, skip')

                continue

            store_cache(md5)
        finally:
            os.unlink(md5)

        in_cache.add(md5)
