import os
import sys

import core.execute as ce
import core.manager as cm


FETCH_SRC_SCRIPT = '''
import sys

ix.fetch_url(sys.argv[-2], sys.argv[-1])
'''.strip()


CHECK_MD5_SCRIPT = '''
import os
import sys

old = sys.argv[1]
new = sys.argv[2]
md5 = sys.argv[3]

print(f'check {old} checksum, expect {md5}')
ix.check_md5(old, md5)
os.link(old, new)
'''.strip()


class Ops:
    def __init__(self, cfg):
        self.cfg = cfg

    def execute_graph(self, graph):
        ce.execute(graph)

    def gc(self):
        cm.Manager(self.cfg).gc_cycle()

    def respawn(self):
        return [sys.executable, self.cfg.binary]

    def runpy(self, args):
        return self.respawn() + ['misc', 'runpy'] + args

    def extract(self):
        return self.respawn() + ['misc', 'extract']

    def fetch(self, sb, url, path):
        return sb.build_py_script(FETCH_SRC_SCRIPT, dict(out=os.path.dirname(path)), [url, path])

    def cksum(self, sb, fr, to, md5):
        return sb.build_py_script(CHECK_MD5_SCRIPT, dict(out=os.path.dirname(to)), [fr, to, md5])
