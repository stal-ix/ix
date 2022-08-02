import os
import sys

import core.repo as cr
import core.execute as ce


class Ops:
    def __init__(self, cfg):
        self.cfg = cfg

    def execute_graph(self, graph):
        ce.execute(graph)

    def gc(self):
        cr.Repo(self.cfg).gc_cycle()

    def respawn(self):
        return [sys.executable, self.cfg.binary]

    def misc(self):
        return self.respawn() + ['misc']

    def misc_cmd(self, *args):
        return [sb.cmd(self.misc() + list(args))]

    def runpy(self, args):
        return [sys.executable, '-'] + args

    def extract(self):
        return self.misc() + ['extract']

    def fetch(self, sb, url, path, md5):
        return self.misc_cmd('fetch', url, path)

    def cksum(self, sb, fr, to, md5):
        return self.misc_cmd('cksum', fr, to, md5)

    def link(self, sb, files, out):
        return self.misc_cmd('link', out, *files)

    def fix(self, sb, node):
        return node
