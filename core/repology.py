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


def export_repology(self):
    pkg_ver = self.descr['repo']['version'].strip()
    pkg_name = self.descr['repo']['name'].strip()

    if pkg_ver and pkg_name:
        if ':' in pkg_name:
            lang, pkg_name = pkg_name.split(':')
        else:
            lang = None

        rec = {
            'category': self.norm_name.split('/')[0],
            'ix_pkg_name': self.norm_name.removesuffix('/unwrap'),
            'ix_pkg_full_name': self.norm_name,
            'pkg_name': pkg_name,
            'pkg_ver': pkg_ver,
            'recipe': 'https://github.com/stal-ix/ix/blob/main/pkgs/' + self.name,
            'maintainers': [
                'anton@samokhvalov.xyz',
            ],
            'upstream_urls': mine_urls(self.descr),
        }

        if lang:
            rec['lang_module'] = lang

        print(json.dumps(rec))
