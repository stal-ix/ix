import os


class Error(Exception):
    def __init__(self, slave, line, lineno):
        Exception.__init__(self)
        self.slave = slave
        self.line = line
        self.lineno = lineno


def tokens(s):
    for x in s.split(','):
        for y in x.split(' '):
            y = y.strip()

            if y:
                yield y


class Parser:
    def parse(self, s):
        body = ''
        keys = {}

        for no, l in enumerate(s.split('\n')):
            try:
                if body:
                    body += l + '\n'
                elif l.startswith('# '):
                    self.on_key(keys, l[2:].strip())
                else:
                    if l.strip():
                        body = l + '\n'
            except Exception as e:
                raise Error(e, l, no + 1)

        if 'do_execute()' in body:
            keys['build']['script'] = {
                'data': body,
                'kind': 'sh',
            }

        return keys

    def on_key(self, keys, l):
        p = l.find(' ')

        if p > 0:
            k = l[:p]
            v = l[p + 1:]
        else:
            k = l
            v = ''

        getattr(self, 'on_' + k.replace('-', '_'))(keys, v.strip())

    def on_build_fetch_url(self, k, v):
        self.on_url(k, v)

    def on_url(self, k, v):
        if 'build' not in k:
            k['build'] = {}

        k = k['build']

        if 'fetch' not in k:
            k['fetch'] = []

        k = k['fetch']

        k.append({'url': v})

    def on_build_fetch_md5(self, k, v):
        self.on_md5(k, v)

    def on_md5(self, k, v):
        k['build']['fetch'][-1]['md5'] = v

    def on_bld(self, k, v):
        self.on_build_depends(k, v)

    def on_build_depends(self, k, v):
        for t in tokens(v):
            self.on_build_depend(k, t)

    def on_build_depend(self, k, v):
        if 'build' not in k:
            k['build'] = {}

        k = k['build']

        if 'depends' not in k:
            k['depends'] = []

        k = k['depends']

        k.append(v)

    def on_run(self, k, v):
        self.on_runtime_depends(k, v)

    def on_runtime_depends(self, k, v):
        for t in tokens(v):
            self.on_runtime_depend(k, t)

    def on_runtime_depend(self, k, v):
        if 'runtime' not in k:
            k['runtime'] = {}

        k = k['runtime']

        if 'depends' not in k:
            k['depends'] = []

        k = k['depends']

        k.append(v)

    def on_lib(self, k, v):
        self.on_bld(k, v)
        self.on_run(k, v)


def parse(s):
    return Parser().parse(s)
