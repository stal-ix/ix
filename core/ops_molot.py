import json
import shutil
import subprocess

import core.error as ce
import core.ops_sys as os_sys


# Minimal Ops for molot as the graph executor. Almost ops_sys, except
# execute_graph pipes JSON to `molot` instead of stock `assemble_ng`.
# Sandbox lives in molot itself, no extra wrapping in argv.
class Ops(os_sys.Ops):
    def __init__(self, cfg):
        self.cfg = cfg
        self.bsdtar = os_sys.choice('bsdtar')

        try:
            self.fetcher = os_sys.choice('fetcher')
        except Exception:
            import core.ops_loc as co
            self.fetcher = None
            self.loc = co.Ops(self.cfg)

        self.molot = shutil.which('molot')

        if not self.molot:
            raise ce.Error('molot binary not found on PATH')

    def execute_graph(self, graph):
        try:
            subprocess.run(
                [self.molot],
                input=json.dumps(graph).encode(),
                check=True,
            )
        except subprocess.CalledProcessError as e:
            raise ce.Error('molot failed', exception=e)
