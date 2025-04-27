import os
import sys

import core.utils as cu


class Ops:
    def respawn(self):
        return []

    def misc(self):
        return []

    def misc_cmd(self, sb, *args):
        return []

    def extract(self):
        return []

    @cu.cached_method
    def boot_path(self):
        return os.environ['PATH'] + ':/ix/realm/boot/bin:/bin:/usr/bin:/usr/local/bin'

    def fetch(self, sb, url, path, md5):
        return [url]

    def link(self, sb, files, out):
        return []

    def fix(self, sb, node):
        return node

    def execute_graph(self, graph):
        sys.exit(0)

    def flags(self):
        return {}
