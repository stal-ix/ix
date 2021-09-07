import os
import shutil
import random

import core.j2 as cj
import core.error as er
import core.utils as cu
import core.realm as cr
import core.execute as ce
import core.package as cp


class Manager:
    def __init__(self, config):
        self._c = config
        self._p = {}
        self._e = cj.Env(config.where)

    @property
    def env(self):
        return self._e

    @property
    def config(self):
        return self._c

    def load_file(self, path):
        with open(os.path.join(self.config.where, path)) as f:
            return f.read()

    def load_package(self, name):
        while True:
            try:
                return self._p[name]
            except KeyError:
                pass

            self._p[name] = cp.Package(name, self)

    def iter_packages(self, names):
        def iter_deps():
            for name in names:
                yield name
                yield from self.load_package(name).all_depends()

        for d in cu.iter_uniq_list(iter_deps()):
            yield self.load_package(d)

    def iter_runtime_packages(self, names):
        def iter_deps():
            for name in names:
                yield name
                yield from self.load_package(name).all_runtime_depends()

        for d in cu.iter_uniq_list(iter_deps()):
            yield self.load_package(d)

    def iter_build_commands(self, names):
        for pkg in self.iter_packages(names):
            yield from pkg.commands()

    def build_graph(self, names):
        return {
            'nodes': list(self.iter_build_commands(names)),
            'targets': [self.load_package(x).out_dir + '/touch' for x in names],
        }

    def all_packages(self):
        for x in cu.iter_dir(self.config.where):
            if os.path.basename(x) in ('package.py', 'package.sh'):
                yield self.load_package(os.path.dirname(x))

    def build_packages(self, pkgs):
        tmp = os.path.join(self.config.store_dir, 'build.' + str(random.random()))

        try:
            shutil.move(self.config.build_dir, tmp)
        except FileNotFoundError:
            pass

        ce.execute(self.build_graph(pkgs))

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

    def iter_used(self):
        for r in self.list_realms():
            rr = self.load_realm(r)

            yield rr.path
            yield from rr.links

    def iter_garbage(self):
        yield from sorted(frozenset(self.iter_gc_candidates()) - frozenset(self.iter_used()))
