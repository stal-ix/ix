#!/usr/bin/env python3

import os

os.environ['SSL_CERT_FILE'] = 'nowhere'

import sys
import json
import itertools

import urllib.request as ur

try:
    import ssl
    ssl._create_default_https_context = ssl._create_unverified_context
except ImportError:
    pass

try:
    import urllib3
    urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)
except ImportError:
    pass

def iter_recs(args):
    for a in args:
        url = f'https://pypi.python.org/pypi/{a}/json'
        data = json.loads(ur.urlopen(url).read())

        for rec in data['urls']:
            if '.whl' in rec['url']:
                yield f'{a}/ix.sh', {
                    'url': rec['url'],
                    'sha': rec['digests']['sha256'],
                }

def dict_merge(it):
    res = {}

    for k, v in it:
        res[k] = dict(itertools.chain(res.get(k, {}).items(), v.items()))

    return res

def update(cur, pkg):
    return dict_merge(itertools.chain(cur.items(), iter_recs(pkg)))

def main():
    pip = os.environ['IX_DIR'] + '/pkgs/pip/pypi.json'

    with open(pip, 'r') as f:
        cur = json.loads(f.read())

    cur = update(cur, sys.argv[1:] or [os.path.dirname(x) for x in cur])

    with open(pip, 'w') as f:
        f.write(json.dumps(cur, indent=4, sort_keys=True).strip() + '\n')

main()
