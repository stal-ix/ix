import os
import subprocess

import core.error as ce
import core.par_exec as cp


def execute_cmd(c):
    env = c.get('env', {})

    try:
        descr = env['out']
    except KeyError:
        descr = str(c)

    try:
        return subprocess.run(c['args'], input=c.get('stdin', '').encode(), env=env, check=True)
    except Exception as e:
        raise ce.Error(f'{descr} failed, {e}')


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


def check_complete(n):
    for o in iter_out(n):
        if os.path.exists(o):
            print(o + ' complete')
        else:
            return False

    return True


def execute_node(n):
    for i in iter_in(n):
        if not os.path.isfile(i):
            raise Exception(f'{i} not ready')

    for c in iter_cmd(n):
        execute_cmd(c)

    for o in iter_out(n):
        if not os.path.isfile(o):
            with open(o, 'w') as f:
                pass


def incomplete_nodes(g):
    by_out = {}

    for n in g['nodes']:
        for o in iter_out(n):
            by_out[o] = n

    v = set()

    def visit(n):
        if n not in v:
            v.add(n)

            t = by_out[n]

            if not check_complete(t):
                for x in iter_in(t):
                    yield from visit(x)

                yield t

    for t in g['targets']:
        yield from visit(t)


def execute(g):
    if 1:
        for n in incomplete_nodes(g):
            execute_node(n)

        return

    by_uid = {}
    by_out = {}

    for i, n in enumerate(incomplete_nodes(g)):
        by_uid[i] = {'uid': i, 'n': n}

        for o in iter_out(n):
            by_out[o] = i

    def iter_deps(n):
        for i in iter_in(n):
            if i in by_out:
                yield by_out[i]

    for i in list(by_uid):
        by_uid[i]['deps'] = list(iter_deps(by_uid[i]['n']))

    class Builder(cp.Builder):
        def build_command(self, n):
           execute_node(n['n'])

    Builder(list(by_uid.values())).build_parallel(2)
