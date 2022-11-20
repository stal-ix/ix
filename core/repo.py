import os
import time
import shutil
import random

import core.error as er
import core.utils as cu
import core.realm as cr


def match(x, lst):
    for l in lst:
        if l in x:
            return True


class Repo:
    def __init__(self, config):
        self.config = config

    def collect_garbage(self, path):
        base = os.path.basename(path)

        if '-' not in base:
            base = base + '.' + str(random.random())

        try:
            shutil.move(path, os.path.join(self.config.ensure_trash_dir(), base))
        except FileNotFoundError:
            pass

    def gc_cycle(self, kind):
        k = [f'-{x}' for x in kind]

        for x in self.iter_garbage():
            if match(x, k):
                print(f'purge {x}')
                self.collect_garbage(x)
            else:
                print(f'stay {x}')

    def load_realm(self, name):
        try:
            return cr.load_realm_ro(self.config, name)
        except FileNotFoundError:
            raise er.Error(f'no such realm {name}')

    def iter_gc_candidates(self):
        yield self.config.build_dir

        p = self.config.store_dir

        for x in os.listdir(p):
            yield os.path.join(p, x)

    def list_realms(self):
        return os.listdir(self.config.realm_dir)

    def iter_realms(self):
        return (self.load_realm(x) for x in self.list_realms())

    def iter_used(self):
        for r in self.list_realms():
            rr = self.load_realm(r)

            yield rr.path
            yield from rr.links

    def iter_garbage(self):
        yield from sorted(frozenset(self.iter_gc_candidates()) - frozenset(self.iter_used()))
