import os
import json
import base64
import jinja2
import hashlib

import core.utils as cu


def b64e(data):
    return base64.b64encode(data.encode()).decode()


def b64d(data):
    return base64.b64decode(data).decode()


def cut_include(l):
    l = l.strip()

    if l.startswith('{% include'):
        l = l[l.find("'") + 1:]
        l = l[:l.find("'")]

        return l


class Loader(jinja2.BaseLoader):
    def __init__(self, vfs):
        self.vfs = vfs
        self.cache = {}

    def join_path(self, tmpl, parent):
        if tmpl.startswith('//'):
            return tmpl

        return os.path.join(os.path.dirname(parent), tmpl)

    def resolve_includes(self, data, name):
        def it():
            for l in data.split('\n'):
                if inc := cut_include(l):
                    yield self.source(self.join_path(inc, name))[0].strip()
                else:
                    yield l

        return '\n'.join(it())

    def source(self, name):
        while True:
            try:
                return self.cache[name]
            except KeyError:
                self.cache[name] = self.calc_source(name)

    def calc_source(self, name):
        if name.startswith('//'):
            return self.source(name[2:])

        if name.endswith('/base64'):
            d, n = self.source(name[:-7])

            return b64e(d), n

        return self.resolve_includes(self.vfs.serve(name).decode(), name), name

    def get_source(self, env, name):
        x, y = self.source(name)

        return x, y, lambda: True


def group_by(k):
    def do(v):
        res = {}

        for x in v:
            kk = x[k]

            if kk in res:
                res[kk].append(x)
            else:
                res[kk] = [x]

        return res

    return do


def fmt_error(s):
    if s == 'vulkan':
        return 'please provide vulkan driver via --vulkan= switch, like in https://github.com/stal-ix/stal-ix.github.io/blob/main/ACCEL.md'

    if s == 'opengl':
        return 'please provide opengl driver via --opengl= switch, like in https://github.com/stal-ix/stal-ix.github.io/blob/main/ACCEL.md'

    return f'{s} undefined'


def flt_defined(v, s):
    if 'jinja2.runtime.Undefined' in str(type(v)):
        raise Exception(fmt_error(s))

    return v


def field(v, n):
    return v.split('.')[n]


def add(v, n):
    return int(v) + int(n)


def strip(v):
    return v.strip()


def pad(v, n):
    while len(v) < n:
        v += '0'

    return v


def fjoin(v, f):
    return f.join(v)


def preproc_it(d):
    for x in d.split('\n'):
        x = x.strip()

        if not x:
            continue

        if x[0] == '#':
            continue

        yield x


def preproc(d):
    return list(preproc_it(d))


def cononize(v):
    return cu.replace_all(' '.join(preproc_it(v)), '  ', ' ')


def parse_urls_it(urls):
    cur = {}

    for l in cononize(urls).split(' '):
        if '://' in l:
            cur['url'] = l
        else:
            cur['md5'] = cu.strip_prefix(l, 'sha:')

        if len(cur) == 2:
            yield cur
            cur = {}


def parse_urls(urls):
    return list(parse_urls_it(urls))


def parse_list_it(lst):
    for x in cononize(lst).split(' '):
        if x:
            yield x


def parse_list(lst):
    return list(parse_list_it(lst))


def list_to_json(lst):
    return json.dumps(preproc(lst))


class Env(jinja2.Environment):
    def __init__(self, fs):
        jinja2.Environment.__init__(self, loader=fs, auto_reload=False, cache_size=-1, trim_blocks=True, lstrip_blocks=True, optimized=True)
        self.filters['b64e'] = b64e
        self.filters['b64d'] = b64d
        self.filters['jl'] = json.loads
        self.filters['jd'] = json.dumps
        self.filters['group_by'] = lambda x, y: group_by(y)(x)
        self.filters['basename'] = os.path.basename
        self.filters['dirname'] = os.path.dirname
        self.filters['ser'] = self.ser
        self.filters['des'] = self.des
        self.filters['lines'] = lambda x: list(x.strip().split('\n'))
        self.filters['eval'] = self.eval
        self.filters['defined'] = flt_defined
        self.filters['strip_prefix'] = cu.strip_prefix
        self.filters['strip_suffix'] = cu.strip_suffix
        self.filters['strip'] = strip
        self.filters['print'] = print
        self.filters['field'] = field
        self.filters['pad'] = pad
        self.filters['add'] = add
        self.filters['preproc'] = preproc
        self.filters['cononize'] = cononize
        self.filters['parse_urls'] = parse_urls
        self.filters['parse_list'] = parse_list
        self.filters['list_to_json'] = list_to_json
        self.filters['fjoin'] = fjoin
        self.kv = {}

    def eval(self, v, code, *args):
        ctx = {}
        exec(code, ctx, ctx)
        return ctx['do'](v, *args)

    def ser(self, v):
        k = hashlib.md5(json.dumps(v, sort_keys=True).encode()).hexdigest()
        self.kv[k] = v
        return k

    def des(self, k):
        return self.kv[k]

    def join_path(self, tmpl, parent):
        return self.loader.join_path(tmpl, parent)
