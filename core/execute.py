import os
import sys
import json
import shutil
import random
import signal
import asyncio
import subprocess

import core.log as cl
import core.error as ce
import core.utils as cu

try:
    from asyncio import to_thread
except ImportError:
    from core.threads import to_thread


def detect_sandbox():
    if sys.platform != 'linux':
        return None

    if not hasattr(os, 'unshare'):
        return None

    return shutil.which('mount')


def move_to_trash(trash_dir, d):
    try:
        os.rename(d, os.path.join(trash_dir, str(random.random())))
    except FileNotFoundError:
        pass
    except Exception:
        try:
            shutil.rmtree(d)
        except FileNotFoundError:
            pass


def keep_going_enabled():
    return os.environ.get('IX_KEEP_GOING') == 'yes'


def execute_cmd(c, n, mt, ix_binary, mount_bin, trash_dir, keep_going):
    env = cu.dict_dict_update(c['env'], {
        'make_thrs': str(mt),
        'IX_RANDOM': str(random.randint(0, 1000000000)),
    })

    args = c['args']

    try:
        descr = env['out']
    except KeyError:
        descr = ' '.join(args)

    cl.log(f'ENTER {descr}', color='b')

    if mount_bin:
        cfg = {
            'mount': mount_bin,
            'node': n,
            'cmd': c,
            'env': env,
        }

        full = [sys.executable, ix_binary, 'exec']
        run_env = os.environ
        run_input = json.dumps(cfg).encode()
    else:
        full = list(args)
        run_env = env
        run_input = c['stdin'].encode()

    try:
        subprocess.run(full, env=run_env, input=run_input, check=True)
    except subprocess.CalledProcessError:
        cl.log(f'ERROR {descr}', color='r')
        for d in n['out_dir']:
            move_to_trash(trash_dir, d)

        if not keep_going:
            os.kill(0, signal.SIGKILL)

        raise ce.Error(f'{descr} failed')
    except Exception as e:
        raise ce.Error(f'{descr} failed', exception=e)

    cl.log(f'LEAVE {descr}', color='b')


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
            'failed': False,
        }


def group_by_out(nodes):
    by_out = {}

    for n in iter_nodes(nodes):
        for o in iter_out(n['n']):
            assert o not in by_out

            by_out[o] = n

    return by_out


class Executor:
    def __init__(self, g, ix_binary):
        pools = g['pools']
        self.s = dict((k, asyncio.Semaphore(v)) for k, v in pools.items())
        self.o = group_by_out(g['nodes'])
        self.l = []
        self.mt = pools['threads']
        self.trash_dir = g['trash_dir']
        self.ix_binary = ix_binary
        self.mount_bin = detect_sandbox()
        self.keep_going = keep_going_enabled()

        os.makedirs(self.trash_dir, exist_ok=True)

        if self.mount_bin:
            cl.log(f'sandbox: mount={self.mount_bin}', color='b')
        else:
            cl.log('sandbox: disabled (Linux/os.unshare/mount missing)', color='y')

    async def visit_lst(self, l):
        return await gather(self.visit_node(self.o[n]) for n in l)

    async def visit_all(self, l):
        failed = await self.visit_lst(l)

        for x in self.l:
            await x

        if any(failed):
            raise ce.Error('one or more nodes failed')

    async def visit_node(self, n):
        async with n['l']:
            if not n['v']:
                try:
                    n['failed'] = await self.do_visit(n['n'])
                except ce.Error as e:
                    if not self.keep_going:
                        raise

                    n['failed'] = True
                    cl.log(f'node failed: {e}', color='r')

                assert not n['v']
                n['v'] = True

            return n['failed']

    async def do_visit(self, n):
        failed = await self.visit_node_impl(n)

        if failed:
            return True

        for o in iter_out(n):
            cl.log(f'TOUCH {o}', color='g')

        return False

    async def visit_node_impl(self, n):
        if all(os.path.isfile(x) for x in iter_out(n)):
            return False

        inputs = list(iter_in(n))
        dep_results = await self.visit_lst(inputs)

        for dep, failed in zip(inputs, dep_results):
            if failed:
                for out in iter_out(n):
                    cl.log(f'BROKEN BY DEP {dep} {out}', color='r')

                return True

        async with self.s[n['pool']]:
            await to_thread(self.execute_node, n)

        return False

    def prepare_dir(self, d):
        move_to_trash(self.trash_dir, d)
        os.makedirs(d, exist_ok=True)

    def execute_node(self, n):
        for d in n['out_dir']:
            self.prepare_dir(d)

        tmp = n['tmp']

        if tmp:
            self.prepare_dir(tmp)

        for c in iter_cmd(n):
            execute_cmd(
                c,
                n,
                self.mt,
                self.ix_binary,
                self.mount_bin,
                self.trash_dir,
                self.keep_going,
            )

        if tmp:
            move_to_trash(self.trash_dir, tmp)

        cu.sync()

        for o in iter_out(n):
            if not os.path.isfile(o):
                with open(o, 'w') as f:
                    pass

        cu.sync()


async def arun(g, ix_binary):
    asyncio.get_running_loop().add_signal_handler(signal.SIGINT, kill_all)
    await Executor(g, ix_binary).visit_all(g['targets'])


def kill_all(*args):
    os.kill(0, signal.SIGKILL)


def execute(g, ix_binary):
    try:
        cmd = [shutil.which('chrt'), '-i', '-p', '0', str(os.getpid())]
        subprocess.check_output(cmd, stderr=subprocess.STDOUT)
    except Exception:
        pass

    os.setpgrp()

    asyncio.run(arun(g, ix_binary))
