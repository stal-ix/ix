import os
import sys
import json
import time
import queue
import shutil
import asyncio
import beautysh
import threading
import itertools
import subprocess

import core.error as ce
import core.cache as cc
import core.utils as cu


COL = {
    'r': 31,
    'g': 32,
    'y': 33,
    'b': 34,
}


ESC = chr(27)


def col(v, color='r', bright=False):
    n = COL[color]

    if bright:
        n += 60

    return f'{ESC}[{n}m{v}{ESC}[0m'


def bsh(s):
    return beautysh.Beautify().beautify_string(s)[0]


def fmt_err(descr, env, stdin, out):
    yield '____|' + descr

    for k, v in env.items():
        yield f'env | export {k}={v}'

    show = False

    for i, l in enumerate(bsh(stdin).strip().splitlines()):
        if l.strip():
            ss = str(i + 1)

            yield ss + ' ' * (4 - len(ss)) + '| ' + l

    yield '----| Script output:'
    yield out[-1000:]


def execute_cmd(c):
    env = c.get('env', {})
    sin = c.get('stdin', '')
    arg = c['args']

    prc = subprocess.Popen(arg, env=env, shell=False, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)

    def send_in():
        if sin:
            prc.stdin.write(sin.encode())

        prc.stdin.close()

    threading.Thread(target=send_in, daemon=True).start()

    while chunk := prc.stdout.read(100):
        try:
            yield chunk.decode()
        except Exception:
            yield str(chunk)

    if rc := prc.wait():
        raise Exception(f'process failed with {rc}')


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


class Node:
    def __init__(self, i, n):
        self.s = time.time()
        self.o = ' '.join(iter_out(n))
        self.n = n
        self.i = i
        self.q = queue.Queue()
        self.t = []
        self.l = ''

    def execute(self):
        for c in iter_cmd(self.n):
            for chunk in execute_cmd(c):
                self.q.put(chunk)

        cu.sync()

        for o in iter_out(self.n):
            if not os.path.isfile(o):
                with open(o, 'w') as f:
                    pass

    def on_chunk(self, txt):
        for c in txt:
            if c == '\n':
                self.t = self.t[-100:] + [self.l]
                self.l = ''
            else:
                self.l += c

    def fmt(self):
        d = ''

        while True:
            try:
                self.on_chunk(self.q.get_nowait())
            except queue.Empty:
                break

        d += col(str(self.i), color='y')
        d += ' | '
        d += col(str(time.time() - self.s)[:5], color='r')
        d += ' | '
        d += col(self.o, color='b')
        d += '\n'

        if self.t:
            d += '\n'.join(x[:100] for x in self.t[-10:]) + '\n'

        return d


class Executor:
    def __init__(self, nodes):
        self.s = {
            'cpu': asyncio.Semaphore(4),
            'other': asyncio.Semaphore(8),
        }

        self.i = 0
        self.o = group_by_out(nodes)
        self.f = {}


    async def visit_lst(self, l):
        await gather(self.visit_node(self.o[n]) for n in l)

    async def visit_all(self, l):
        await self.visit_lst(l)

    async def visit_node(self, n):
        async with n['l']:
            if not n['v']:
                await self.do_visit(n['n'])
                assert not n['v']
                n['v'] = True

    async def do_visit(self, n):
        await self.visit_node_impl(n)

    def next_i(self):
        r = self.i

        self.i += 1

        return r

    async def visit_node_impl(self, n):
        if all(os.path.isfile(x) for x in iter_out(n)):
            return

        await self.visit_lst(iter_in(n))

        async with self.s[n['pool']]:
            node = Node(self.next_i(), n)

            try:
                self.f[node.i] = node
                await asyncio.to_thread(node.execute)
            finally:
                del self.f[node.i]


class ExecutorGUI(Executor):
    def __init__(self, nodes):
        Executor.__init__(self, nodes)
        asyncio.create_task(self.repaint())

    def fmt(self):
        yield f'{ESC}[2J{ESC}[H'

        for v in sorted(self.f.values(), key=lambda x: x.i):
            yield v.fmt()

    async def repaint(self):
        while True:
            print(''.join(self.fmt()).strip(), file=sys.stderr)
            await asyncio.sleep(0.1)


async def arun(g):
    await ExecutorGUI(g['nodes']).visit_all(g['targets'])


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
