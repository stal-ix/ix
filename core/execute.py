import os
import asyncio
import beautysh
import itertools
import subprocess

import core.error as ce
import core.cache as cc
import core.utils as cu


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

        print(res.stdout.decode())

        res.check_returncode()
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
    def __init__(self, nodes):
        self.s = asyncio.Semaphore(3)
        self.o = group_by_out(nodes)
        self.l = []

    async def visit_all(self, l):
        await gather(self.visit_node(self.o[n]) for n in l)

        for x in self.l:
            await x

    async def visit_node(self, n):
        async with n['l']:
            if not n['v']:
                await self.visit_node_impl(n['n'])

                for x in iter_out(n['n']):
                    print(f'{x} complete')

                n['v'] = True

    async def visit_node_impl(self, n):
        if all(os.path.isfile(x) for x in iter_out(n)):
            return

        cached = n.get('cache', False)

        if cached:
            if await asyncio.to_thread(self.load, n):
                return

        await gather(self.visit_node(self.o[x]) for x in iter_in(n))

        async with self.s:
            await asyncio.to_thread(self.execute_node, n)

        if cached:
            self.l.append(asyncio.create_task(asyncio.to_thread(self.store, n)))

    def execute_node(self, n):
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
            if 'AWS_' not in str(e):
                raise e


def execute(g):
    asyncio.run(Executor(g['nodes']).visit_all(g['targets']))
