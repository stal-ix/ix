import os
import sys
import json
import shutil
import asyncio
import beautysh
import threading
import itertools
import subprocess

import core.error as ce
import core.utils as cu


def bsh(s):
    if 'atexit.register' in s:
        return s

    return beautysh.Beautify().beautify_string(s)[0]


COL = {
    'r': 31,
    'g': 32,
    'y': 33,
    'b': 34,
}

def col(v, color='r', bright=False):
    n = COL[color]

    if bright:
        n += 60

    return f'\x1b[{n}m{v}\x1b[0m'


def log(*args, **kwargs):
    print(col(*args, **kwargs), file=sys.stderr)


def fmt_err(args, script, output, env):
    yield '____| ' + ' '.join(args)

    for k, v in env.items():
        yield f'    | export {k}={v}'

    for i, l in enumerate(bsh(script).strip().splitlines()):
        if l.strip():
            ss = str(i + 1)

            yield ss + ' ' * (4 - len(ss)) + '| ' + l

    if output:
        yield '____|_______________________________________'

        for l in output.split('\n')[-100:]:
            yield col(l, color='r')

        yield '____________________________________________'


def async_send(proc, stdin):
    def f():
        if stdin:
            proc.stdin.write(stdin.encode())

        proc.stdin.close()

    threading.Thread(target=f, daemon=True).start()


def execute_cmd(c, mt):
    env = cu.dict_dict_update(c.get('env', {}), {'make_thrs': str(mt)})
    stdin = c.get('stdin', '')
    args = c['args']
    descr = env['out']
    output = ''

    log(f'ENTER {descr}', color='b')

    try:
        with subprocess.Popen(args, env=env, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.STDOUT) as proc:
            async_send(proc, stdin)

            while chunk := proc.stdout.read1().decode():
                sys.stderr.write(chunk)
                output += chunk

                if len(output) > 20000:
                    output = output[10000:]

            if rc := proc.wait():
                raise Exception(f'process failed with retcode {rc}')
    except Exception as e:
        output = '\n'.join((output, str(e)))
        script = '\n'.join(fmt_err(args, stdin, output, env)).strip()

        raise ce.Error(f'{descr} failed', context=script)
    finally:
        log(f'LEAVE {descr}', color='b')


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


async def gather(it):
    return await asyncio.gather(*list(it))


def iter_nodes(nodes):
    for n in cu.iter_uniq_list(nodes):
        yield {
            'n': n,
            'l': asyncio.Lock(),
            'v': False,
        }


def group_by_out(nodes):
    by_out = {}

    for n in iter_nodes(nodes):
        for o in iter_out(n['n']):
            assert o not in by_out

            by_out[o] = n

    return by_out


class Executor:
    def __init__(self, nodes, pools):
        self.s = {
            'cpu': asyncio.Semaphore(pools['cpu']),
            'other': asyncio.Semaphore(pools['other']),
        }

        self.o = group_by_out(nodes)
        self.l = []
        self.f = set()
        self.mt = 14

    async def visit_lst(self, l):
        await gather(self.visit_node(self.o[n]) for n in l)

    async def visit_all(self, l):
        await self.visit_lst(l)

        for x in self.l:
            await x

    def in_fly(self):
        log('\n'.join('INFLY ' + x for x in sorted(self.f)), color='y')

    async def visit_node(self, n):
        async with n['l']:
            if not n['v']:
                await self.do_visit(n['n'])
                assert not n['v']
                n['v'] = True

    async def do_visit(self, n):
        await self.visit_node_impl(n)

        for o in iter_out(n):
            log(f'TOUCH {o}', color='g')

    async def visit_node_impl(self, n):
        if all(os.path.isfile(x) for x in iter_out(n)):
            return

        await self.visit_lst(iter_in(n))

        async with self.s[n['pool']]:
            for o in iter_out(n):
                self.f.add(o)
                self.in_fly()

            await asyncio.to_thread(self.execute_node, n)

            for o in iter_out(n):
                self.f.remove(o)
                self.in_fly()

    def execute_node(self, n):
        for c in iter_cmd(n):
            execute_cmd(c, self.mt)

        cu.sync()

        for o in iter_out(n):
            if not os.path.isfile(o):
                with open(o, 'w') as f:
                    pass


async def arun(g):
    await Executor(g['nodes'], g['pools']).visit_all(g['targets'])


def execute(g):
    try:
        cmd = [shutil.which('chrt'), '-i', '-p', '0', str(os.getpid())]
        subprocess.check_output(cmd, stderr=subprocess.STDOUT)
    except Exception:
        # TODO(pg): log it
        pass

    asyncio.run(arun(g))


def cli_execute(ctx):
    execute(json.loads(sys.stdin.read()))
