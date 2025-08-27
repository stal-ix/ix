import os
import sys

import core.repo as cr
import core.utils as cu
import core.execute as ce


class Ops:
    def __init__(self, cfg):
        self.cfg = cfg

    def execute_graph(self, graph):
        ce.execute(graph, self.cfg.ensure_trash_dir())

    def gc(self, kind):
        cr.Repo(self.cfg).gc_cycle(kind)

    def respawn(self):
        return [sys.executable, self.cfg.binary]

    def misc(self):
        return self.respawn() + ['misc']

    def misc_cmd(self, sb, *args, env={}):
        return [sb.cmd(self.misc() + list(args), env=env)]

    def extract(self):
        return self.misc() + ['extract']

    def fetch(self, sb, url, path, md5):
        env = {
            'PATH': self.boot_path(),
        }

        return self.misc_cmd(sb, 'fetch', url, path, md5, *sb.package.manager.mirrors, env=env)

    def link(self, sb, files, out):
        return self.misc_cmd(sb, 'link', out, *files)

    def fix(self, sb, node):
        return node

    @cu.cached_method
    def boot_path(self):
        return os.environ['PATH']

    def flags(self):
        return {}
