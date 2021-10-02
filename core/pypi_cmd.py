import os
import sys
import json
import itertools

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


def dict_merge(it):
    res = {}

    for k, v in it:
        res[k] = dict(itertools.chain(res.get(k, {}).items(), v.items()))

    return res


def cli_pypi_update(ctx):
    cur = json.loads(sys.stdin.read())
    pkg = ctx['args']

    if not pkg:
        pkg = [os.path.dirname(x) for x in cur]

    print(json.dumps(dict_merge(itertools.chain(cur.items(), iter_recs(pkg))), indent=4, sort_keys=True))
