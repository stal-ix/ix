import os
import json
import base64
import jinja2
import hashlib


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

        return self.resolve_includes(self.vfs.serve(name), name), name

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


class Env(jinja2.Environment):
    def __init__(self, fs):
        jinja2.Environment.__init__(self, loader=fs, auto_reload=False, cache_size=-1, trim_blocks=True, lstrip_blocks=True, optimized=True)
        self.filters['b64e'] = b64e
        self.filters['b64d'] = b64d
        self.filters['jl'] = json.loads
        self.filters['jd'] = json.dumps
        self.filters['group_by'] = lambda x, y: group_by(y)(x)
        self.filters['basename'] = os.path.basename
        self.filters['ser'] = self.ser
        self.filters['des'] = self.des
        self.filters['lines'] = lambda x: list(x.strip().split('\n'))
        self.filters['eval'] = self.eval
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
