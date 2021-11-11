import os
import json

import core.utils as cu
import core.error as ce


class FileLoader:
    def __init__(self, pkg):
        self.pkg = pkg

    def __getattr__(self, name):
        fname = name.replace('_', '.')

        return {
            'kind': fname.split('.')[-1],
            'data': self.pkg.template(os.path.join(os.path.dirname(self.pkg.name), fname)),
        }


def preproc(d):
    for x in d.split('\n'):
        x = x.strip()

        if not x:
            continue

        if x[0] == '#':
            continue

        yield x


def cononize(v):
    s = ' '.join(preproc(v))

    while '  ' in s:
        s = s.replace('  ', ' ')

    return s


def parse_urls(urls):
    cur = {}

    for l in cononize(urls).split(' '):
        if ':' in l:
            cur['url'] = l
        else:
            cur['md5'] = l

        if len(cur) == 2:
            yield cur
            cur = {}


class RenderContext:
    def __init__(self, package):
        self.package = package

    def render(self):
        return json.loads(self.template(self.name))

    def fix_list(self, lst):
        return cononize(lst)

    def parse_list(self, lst):
        for x in self.fix_list(lst).split(' '):
            if x:
                yield x

    def string_to_json(self, s):
        return json.dumps(s)

    def urls_to_json(self, urls):
        return json.dumps(list(parse_urls(urls)))

    def list_to_json(self, lst):
        return json.dumps(list(self.parse_list(lst)))

    @property
    def platform(self):
        return self.config.platform

    @property
    def config(self):
        return self.package.manager.config

    @property
    def files(self):
        return FileLoader(self)

    @property
    def name(self):
        return self.package.name

    @property
    def flags(self):
        return self.package.flags

    @property
    def os(self):
        return self.platform['target']['os']

    def if_linux(self, v):
        return self.if_os(v, 'linux')

    def if_darwin(self, v):
        return self.if_os(v, 'darwin')

    def if_os(self, v, os):
        if self.os == os:
            return v

        return ''

    def template(self, path):
        tmpl = self.package.manager.env.get_template(path)

        try:
            return self.strip_template(tmpl.render(mix=self, **self.flags))
        except Exception as e:
            raise ce.Error(f'can not render {path}', exception=e)

    def strip_template(self, v):
        vv = v.replace('\n\n\n', '\n\n')

        if vv == v:
            return v

        return self.strip_template(vv)
