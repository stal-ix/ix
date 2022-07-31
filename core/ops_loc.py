import os
import sys


LINK_SRCS_SCRIPT = '''
import sys
import os

out = os.environ['out']
os.chdir(out)

for f in sys.argv[1:]:
    print(f'link {f} into {out}')
    os.link(f, os.path.basename(f))
'''.strip()


class Ops:
    def __init__(self, cfg):
        self.cfg = cfg

    def execute_graph(self, graph):
        import core.execute as ce
        ce.execute(graph)

    def gc(self):
        import core.repo as cr
        cr.Repo(self.cfg).gc_cycle()

    def respawn(self):
        return [sys.executable, self.cfg.binary]

    def misc(self):
        return self.respawn() + ['misc']

    def runpy(self, args):
        return self.misc() + ['runpy'] + args

    def extract(self):
        return self.misc() + ['extract']

    def fetch(self, sb, url, path, md5):
        return [sb.cmd(self.misc() + ['fetch', url, path])]

    def cksum(self, sb, fr, to, md5):
        return [sb.cmd(self.misc() + ['cksum', fr, to, md5])]

    def link(self, sb, files, out):
        return sb.build_py_script(LINK_SRCS_SCRIPT, dict(out=out), files)
