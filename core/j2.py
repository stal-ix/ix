import os
import base64
import jinja2


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


class MyCache(jinja2.BytecodeCache):
    def __init__(self):
        self.c = {}

    def load_bytecode(self, bucket):
        try:
            bucket.bytecode_from_string(self.c[bucket.key])
        except KeyError:
            pass

    def dump_bytecode(self, bucket):
        self.c[bucket.key] = bucket.bytecode_to_string()


class Loader:
    def __init__(self, vfs):
        self.vfs = vfs
        self.bc = MyCache()
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


class Env(jinja2.Environment, jinja2.BaseLoader):
    def __init__(self, fs):
        jinja2.Environment.__init__(self, bytecode_cache=fs.bc, loader=self, auto_reload=False, cache_size=-1, trim_blocks=True, lstrip_blocks=True, optimized=False)
        self.fs = fs
        self.filters['b64e'] = b64e
        self.filters['b64d'] = b64d
        self.filters['basename'] = os.path.basename

    def child(self):
        return Env(self.fs)

    def get_source(self, env, name):
        x, y = self.fs.source(name)

        return x, y, lambda: True

    def join_path(self, tmpl, parent):
        return self.fs.join_path(tmpl, parent)
