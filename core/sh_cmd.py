import os

import core.error as ce
import core.manager as cm
import core.cmd_line as cc


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
    def __init__(self):
        pass

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

        if 'build()' in body:
            keys['build']['script'] = {
                'data': body + '\nbuild',
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


def gen_sh(p):
    d = p.descr

    fetch = []
    lib = []
    dep = []
    run = []
    script = ''

    if 'build' in d:
        b = d['build']

        if 'script' in b:
            script = b['script']['data']

        if 'fetch' in b:
            fetch.extend(b['fetch'])

        if 'depends' in b:
            dep.extend(b['depends'])

    if 'runtime' in d:
        r = d['runtime']

        if 'depends' in r:
            run.extend(r['depends'])

    common = frozenset(dep) & frozenset(run)

    def iter_lib():
        for d in dep:
            if d in common:
                yield d

    lib = list(iter_lib())

    def iter_dep():
        for d in dep:
            if d not in common:
                yield d

    dep = list(iter_dep())

    def iter_run():
        for d in run:
            if d not in common:
                yield d

    run = list(iter_run())

    def iter_lines():
        for f in fetch:
            yield '# url ' + f['url']
            yield '# md5 ' + f['md5']

        if lib:
            yield '# lib ' + ' '.join(lib)

        if dep:
            yield '# bld ' + ' '.join(dep)

        if run:
            yield '# run ' + ' '.join(run)

        if script:
            yield ''

            yield 'build() {'
            yield script.strip()
            yield '}'

    return '\n'.join(iter_lines())


def cli_sh(ctx):
    config, pkgs = cc.parse_pkgs(ctx)

    for p in pkgs:
        print(gen_sh(cm.Manager(config).load_package(p)))
