import os
import sys
import json
import shutil
import asyncio
import subprocess

import core.error as ce
import core.utils as cu


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


def execute_cmd(c, mt):
    env = cu.dict_dict_update(c.get('env', {}), {'make_thrs': str(mt)})
    args = c['args']

    try:
        descr = env['out']
    except KeyError:
        descr = ' '.join(args)

    log(f'ENTER {descr}', color='b')

    try:
        subprocess.run(args, env=env, input=c.get('stdin', '').encode(), check=True)
    except Exception as e:
        raise ce.Error(f'{descr} failed', exception=e)

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

            await asyncio.to_thread(self.execute_node, n)

            for o in iter_out(n):
                self.f.remove(o)

    def execute_node(self, n):
        for c in iter_cmd(n):
            execute_cmd(c, self.mt)

        cu.sync()

        for o in iter_out(n):
            if not os.path.isfile(o):
                with open(o, 'w') as f:
                    pass

        cu.sync()


async def arun(g):
    await Executor(g['nodes'], g['pools']).visit_all(g['targets'])


def execute(g):
    try:
        cmd = [shutil.which('chrt'), '-i', '-p', '0', str(os.getpid())]
        subprocess.check_output(cmd, stderr=subprocess.STDOUT)
    except Exception:
        pass

    asyncio.run(arun(g))
