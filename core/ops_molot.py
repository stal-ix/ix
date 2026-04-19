import os
import json
import shutil
import subprocess

import core.error as ce
import core.ops_sys as os_sys


# Minimal Ops for molot as the graph executor. Almost ops_sys, except:
#   - execute_graph pipes JSON to `molot` instead of stock `assemble`.
#   - flags() drops the 'stalix' flag, because molot already isolates
#     the cmd (its own unshare+overlay), and the stalix branch of
#     die/sh0.sh (confine+tmpfs) adds a nested user ns that breaks
#     overlay whiteouts.
#   - __init__ queries `molot hash` and pushes it into IX_FLAGS so
#     every uid mixes that hash in via # {{molot}} in die/sh0.sh.
#     Same molot version on every worker → one uid per logical node
#     across the fleet (no more multiuid fragmentation).
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

        hash_out = subprocess.check_output([self.molot, 'hash']).decode().strip()
        extra = f'molot={hash_out}'
        cur = os.environ.get('IX_FLAGS', '').strip()
        os.environ['IX_FLAGS'] = f'{cur},{extra}' if cur else extra

    def execute_graph(self, graph):
        try:
            subprocess.run(
                [self.molot],
                input=json.dumps(graph).encode(),
                check=True,
            )
        except subprocess.CalledProcessError as e:
            raise ce.Error('molot failed', exception=e)

    def flags(self):
        return {}
