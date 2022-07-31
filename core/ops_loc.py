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

    def runpy(self, args):
        return [sys.executable, '-'] + args

    def extract(self):
        return self.misc() + ['extract']

    def fetch(self, sb, url, path, md5):
        return [sb.cmd(self.misc() + ['fetch', url, path])]

    def cksum(self, sb, fr, to, md5):
        return [sb.cmd(self.misc() + ['cksum', fr, to, md5])]

    def link(self, sb, files, out):
        return sb.cmd(self.misc() + ['link', out] + files)
