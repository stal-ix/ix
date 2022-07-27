import os
import time
import shutil
import random

import core.error as er
import core.utils as cu
import core.realm as cr


class Repo:
    def __init__(self, config):
        self._c = config

    @property
    def config(self):
        return self._c

    def load_file(self, path):
        with open(os.path.join(self.config.where, path)) as f:
            return f.read()

    def collect_garbage(self, path):
        base = os.path.basename(path)

        if '-' not in base:
            base = base + '.' + str(random.random())

        try:
            shutil.move(path, os.path.join(self.config.ensure_trash_dir(), base))
        except FileNotFoundError:
            pass

    def gc_cycle(self):
        for x in self.iter_garbage():
            print(f'purge {x}')
            self.collect_garbage(x)

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
