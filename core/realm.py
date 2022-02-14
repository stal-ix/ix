import os
import sys
import json
import base64
import shutil
import itertools

import core.gg as cg
import core.utils as cu


def realm_path(mngr, name):
    return os.path.join(mngr.config.realm_dir, name)


def collapse_pkgs(pkgs):
    v = []
    d = {}

    for p in pkgs:
        n = p['name']

        if n in d:
            d[n] = cu.dict_dict_update(d[n], p.get('flags', {}))
        else:
            v.append(n)
            d[n] = p.get('flags', {})

    return [{'name': x, 'flags': d[x]} for x in v]


def flt(it):
    s = set()

    for p in it:
        if p.uid not in s:
            s.add(p.uid)

            if p.buildable():
                yield p


class RealmCtx:
    def __init__(self, mngr, name, pkgs):
        self.mngr = mngr
        self.pkg_name = name
        self.pkgs = pkgs

        sd = self.mngr.config.store_dir
        uids = [x.uid for x in self.iter_all_build_depends()]

        self.uid = cu.struct_hash([3, self.pkg_name, sd, self.build_script()] + uids)
        self.out_dir = f'{sd}/{self.uid}-rlm-{self.pkg_name}'

    def calc_all_runtime_depends(self):
        def iter_deps():
            for p in self.mngr.load_packages(self.pkgs):
                yield p
                yield from p.iter_all_runtime_depends()

        return flt(iter_deps())

    @cu.cached_method
    def iter_all_runtime_depends(self):
        return list(self.calc_all_runtime_depends())

    def calc_all_build_depends(self):
        def iter_deps():
            pkgs = [{'name': x} for x in ('bld/python', 'bld/sh', 'bld/bootbox')]

            for p in self.mngr.load_packages(pkgs):
                yield p
                yield from p.iter_all_runtime_depends()

        return flt(iter_deps())

    @cu.cached_method
    def iter_all_build_depends(self):
        return list(self.calc_all_build_depends()) + self.iter_all_runtime_depends()

    def iter_build_commands(self):
        yield {
            'in_dir': [x.out_dir for x in self.iter_all_build_depends()],
            'out_dir': [self.out_dir],
            'cmd': [self.build_cmd()],
            'cache': False,
        }

    def buildable(self):
        return True

    def build_script(self):
        descr = {
            'pkgs': self.pkgs,
            'links': [p.out_dir for p in self.iter_all_runtime_depends()],
        }

        meta = base64.b64encode(json.dumps(descr).encode()).decode()

        return self.mngr.env.get_template('//mix/realm.py').render(meta=meta)

    def build_cmd(self):
        return {
            'args': ['python3'],
            'stdin': self.build_script(),
            'env': {
                'out': self.out_dir,
                'PATH': ':'.join((x.out_dir + '/bin' for x in self.iter_all_build_depends())),
            },
        }


class Realm:
    def __init__(self, mngr, name, path):
        self.name = name
        self.path = path
        self.mngr = mngr

        with open(os.path.join(self.path, 'touch'), 'r') as f:
            pass

        with open(os.path.join(self.path, 'meta.json'), 'r') as f:
            self.meta = json.loads(f.read())

    @property
    def pkgs(self):
        return self.meta['pkgs']

    @property
    def links(self):
        return self.meta['links']

    def new_version(self, pkgs):
        return prepare_realm(self.mngr, self.name, pkgs)

    def add(self, pkgs):
        return self.new_version(collapse_pkgs(self.pkgs + pkgs))

    def remove(self, pkgs):
        pkgs = frozenset([x['name'] for x in pkgs])

        def it():
            for x in self.pkgs:
                if x['name'] not in pkgs:
                    yield x

        return self.new_version(list(it()))

    def upgrade(self):
        cu.step('upgrade')

        try:
            return self.new_version(self.pkgs)
        finally:
            cu.step('done upgrade')

    @property
    def managed_path(self):
        return realm_path(self.mngr, self.name)

    def install(self):
        path = self.managed_path

        try:
            os.makedirs(os.path.dirname(path))
        except Exception:
            pass

        tmp = path + '.tmp'

        os.symlink(self.path, tmp)
        cu.sync()
        os.rename(tmp, path)
        cu.sync()

    def uninstall(self):
        os.unlink(self.managed_path)


def load_realm(mngr, name):
    return Realm(mngr, name, os.readlink(realm_path(mngr, name)))


def prepare_realm(mngr, name, pkgs):
    ctx = RealmCtx(mngr, name, pkgs)

    cg.run([ctx])

    return Realm(mngr, name, ctx.out_dir)
