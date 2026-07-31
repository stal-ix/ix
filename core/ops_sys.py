import os
import sys
import json
import shutil
import getpass
import subprocess

import core.utils as cu
import core.error as ce
import core.ops_loc as co


def run_cmd(cmd, input='', user='ix'):
    ru = getpass.getuser()

    if ru == user:
        suffix = [cmd[0]]
        prefix = []
    elif ru == 'root':
        suffix = ['/bin/su', '-s', cmd[0], user]
        prefix = []
    elif user == 'root':
        suffix = [cmd[0]]
        prefix = ['/bin/sudo']
    else:
        suffix = ['/bin/su', '-s', cmd[0], user]
        prefix = ['/bin/sudo']

    cmd = prefix + [
        '/bin/flock', '-x', '/ix',
        '/bin/chrt', '-i', '0',
        '/bin/nice', '-n', '20',
    ] + suffix + cmd[1:]

    try:
        subprocess.run(cmd, shell=False, input=input.encode(), check=True)
    except subprocess.CalledProcessError as e:
        raise e
    except Exception as e:
        raise ce.Error(' '.join(cmd) + ' failed', exception=e)


def gen_links(files, out):
    for x in files:
        yield ['/bin/ln', x, os.path.join(out, os.path.basename(x))]


def choice(b):
    if r := shutil.which(b, path='/ix/realm/system/bin:/bin:/bin/bin_ix'):
        return r

    raise Exception(f'can not find any of {b}')


class Ops:
    def __init__(self, cfg):
        self.cfg = cfg
        self.assemble = os.environ.get('IX_ASSEMBLE') or choice('assemble')
        self.bsdtar = choice('bsdtar')

        try:
            self.fetcher = choice('fetcher')
        except Exception:
            self.fetcher = None
            self.loc = co.Ops(self.cfg)

    def execute_graph(self, graph):
        run_cmd([self.assemble], input=json.dumps(graph))

    def gc(self, kind):
        run_cmd(['/bin/env', 'IX_EXEC_KIND=local', sys.executable, self.cfg.binary, 'gc'] + kind, user='root')

    def extract(self):
        return [self.bsdtar, '--no-same-permissions', '--no-same-owner', '-x', '-f']

    def fetch(self, sb, url, path, md5):
        if self.fetcher:
            return [sb.cmd([self.fetcher, url, path, md5])]

        return self.loc.fetch(sb, url, path, md5)

    def link(self, sb, files, out):
        return sb.cmds(gen_links(files, out))

    def boot_path(self):
        return '/ix/realm/boot/bin:/bin:/usr/bin:/usr/local/bin'

    def flags(self):
        return {}
