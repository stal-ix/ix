#!/usr/bin/env python3

import sys
import json

def mine_urls_1(data):
    return [x['url'] for x in data['bld']['fetch']]

def parse_url(l):
    l = l[l.index('http'):]

    for v in ',"':
        if v in l:
            l = l[:l.index(v)]

    return l

def mine_urls_2(data):
    for l in json.dumps(data, indent=4, sort_keys=True).split('\n'):
        if 'http://' in l or 'https://' in l:
            if 'proxy.golang.org' in l:
                pass
            else:
                url = parse_url(l)

                if ' ' in url:
                    pass
                else:
                    yield url

def mine_urls(data):
    return list(sorted(frozenset(list(mine_urls_1(data)) + list(mine_urls_2(data)))))

def export_repology(rec):
    pkg_ver = rec['descr']['repo']['version'].strip()
    pkg_name = rec['descr']['repo']['name'].strip()

    if pkg_ver and pkg_name:
        if ':' in pkg_name:
            lang, pkg_name = pkg_name.split(':')
        else:
            lang = None

        res = {
            'category': rec['norm_name'].split('/')[0],
            'ix_pkg_fs_name': rec['pkg_name'],
            'ix_pkg_name': rec['norm_name'].removesuffix('/unwrap'),
            'ix_pkg_full_name': rec['norm_name'],
            'pkg_name': pkg_name,
            'pkg_ver': pkg_ver,
            'recipe': 'https://github.com/stal-ix/ix/blob/main/pkgs/' + rec['name'],
            'maintainers': [
                'anton@samokhvalov.xyz',
            ],
            'upstream_urls': mine_urls(rec['descr']),
        }

        if lang:
            res['lang_module'] = lang

        return res

for l in sys.stdin.readlines():
    l = l.strip()

    if not l:
        continue

    if res := export_repology(json.loads(l)):
        print(json.dumps(res))
