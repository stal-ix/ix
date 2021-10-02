import json
import pprint

import urllib.request as ur

import core.error as ce


def iter_recs(args):
    for a in args:
        url = f'https://pypi.python.org/pypi/{a}/json'

        try:
            data = json.loads(ur.urlopen(url).read())
        except Exception as e:
            raise ce.Error(f'can not load pypi info for {a}', exception=e)

        for rec in data['urls']:
            if '.whl' in rec['url']:
                yield f'{a}/package.sh', {
                    'url': rec['url'],
                    'md5': rec['md5_digest'],
                }


def cli_pypi_gen(ctx):
    pprint.pprint(dict(iter_recs(ctx['args'])))
