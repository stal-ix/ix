import os
import time
import shutil
import random

import core.j2 as cj
import core.vfs as cv
import core.error as er
import core.utils as cu
import core.realm as cr
import core.package as cp


class Manager:
    def __init__(self, config):
        self._c = config
        self._p = {}
        self._x = {}
        self._e = cj.Env(cv.vfs(config.where))

    @property
    def env(self):
        return self._e

    @property
    def config(self):
        return self._c

    def load_file(self, path):
        with open(os.path.join(self.config.where, path)) as f:
            return f.read()

    def load_impl(self, sel):
        return cp.Package(sel, self)

    def load_hard(self, p):
        u = p.uid

        while True:
            try:
                return self._p[u]
            except KeyError:
                self._p[u] = p

    def load_package(self, selector):
        key = cu.struct_hash(selector)

        while True:
            try:
                return self._x[key]
            except KeyError:
                self._x[key] = self.load_hard(self.load_impl(selector))

    def load_packages(self, ss):
        for s in ss:
            yield self.load_package(s)

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
            return cr.load_realm(self, name)
        except FileNotFoundError:
            raise er.Error(f'no such realm {name}')

    def prepare_realm(self, name, pkgs):
        return cr.prepare_realm(self, name, pkgs)

    def ensure_realm(self, name):
        try:
            return cr.load_realm(self, name)
        except FileNotFoundError as e:
            print(f'create new realm {name}')

        return self.prepare_realm(name, [])

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
