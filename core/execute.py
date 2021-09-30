import os
import beautysh
import itertools
import subprocess

import core.error as ce
import core.cache as cc


def bsh(s):
    return beautysh.Beautify().beautify_string(s)[0]


def execute_cmd(c):
    env = c.get('env', {})

    try:
        descr = env['out']
    except KeyError:
        descr = str(c)

    stdin = c.get('stdin', '')

    try:
        return subprocess.run(c['args'], input=stdin.encode() or None, env=env, check=True)
    except Exception as e:
        def iter_lines():
            yield '____|' + descr

            for k, v in env.items():
                yield f'env | export {k}={v}'

            show = False

            for i, l in enumerate(bsh(stdin).strip().splitlines()):
                if '# suc' in l:
                    show = True
                    continue

                if '# euc' in l:
                    show = False
                    continue

                if show:
                    if l.strip():
                        ss = str(i + 1)

                        yield ss + ' ' * (4 - len(ss)) + '| ' + l

        script = '\n'.join(iter_lines()).strip()

        raise ce.Error(f'{descr} failed', context=script, exception=e)


def iter_in(c):
    if 'in' in c:
        yield from c['in']

    if 'in_dir' in c:
        for x in c['in_dir']:
            yield x + '/touch'


def iter_out(c):
    if 'out' in c:
        yield from c['out']

    if 'out_dir' in c:
        for x in c['out_dir']:
            yield x + '/touch'


def iter_cmd(c):
    if 'cmd' in c:
        yield from c['cmd']


class Executor:
    def __init__(self, g):
        self.c = set()

        by_out = {}

        for n in g['nodes']:
            for o in iter_out(n):
                by_out[o] = n

        self.o = by_out

    def visit_all(self, l):
        for n in l:
            self.visit_node(self.o[n])

    def visit_node(self, n):
        if all(self.exists(x) for x in iter_out(n)):
            return

        cached = n.get('cache', False)

        if cached:
            if self.load(n):
                return

        for x in iter_in(n):
            self.visit_node(self.o[x])

        self.execute_node(n)

        if cached:
            self.store(n)

    def execute_node(self, n):
        for i in iter_in(n):
            if not self.exists(i):
                raise ce.Error(f'{i} does not exixts')

        for c in iter_cmd(n):
            execute_cmd(c)

        for o in iter_out(n):
            if not os.path.isfile(o):
                with open(o, 'w') as f:
                    pass

    def load(self, n):
        try:
            for d in n['out_dir']:
                cc.restore_dir(d)

            return True
        except Exception as e:
            if '404' not in str(e):
                raise e

        return False

    def store(self, n):
        try:
            for d in n['out_dir']:
                cc.store_dir(d)
        except Exception as e:
            if 'Unable to locate credentials' not in str(e):
                raise e

    def exists(self, p):
        if p in self.c:
            return True

        if os.path.isfile(p):
            print(f'{p} complete')

            self.c.add(p)

            return True

        return False


def execute(g):
    Executor(g).visit_all(g['targets'])
