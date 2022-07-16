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
    d = {}

    for p in pkgs:
        n = p['name']

        if p.get('op', '+') == '+':
            d[n] = cu.dict_dict_update(d.get(n, {}), p.get('flags', {}))
        else:
            d.pop(n)

    return [{'name': x, 'flags': y} for x, y in d.items()]


def flt(it):
    s = set()

    for p in it:
        if p.uid not in s:
            s.add(p.uid)

            if p.buildable():
                yield p


def flatten(flags, pkgs):
    for p in pkgs:
        yield {
            'name': p['name'],
            'flags': cu.dict_dict_update(flags, p.get('flags', {})),
        }


class RealmCtx:
    def __init__(self, mngr, name, pkgs):
        self.mngr = mngr
        self.pkg_name = name
        self.pkgs = pkgs

        sd = self.mngr.config.store_dir
        uids = [x.uid for x in self.iter_all_build_depends()]

        self.uid = cu.struct_hash([4, self.pkg_name, sd, self.build_script()] + uids)
        self.out_dir = f'{sd}/{self.uid}-rlm-{self.pkg_name}'

    def flat_pkgs(self):
        return flatten(self.pkgs['flags'], self.pkgs['list'])

    def calc_all_runtime_depends(self):
        for p in self.mngr.load_packages(self.flat_pkgs()):
            yield p
            yield from p.iter_all_runtime_depends()

    @cu.cached_method
    def iter_all_runtime_depends(self):
        return list(flt(self.calc_all_runtime_depends()))

    def calc_all_build_depends(self):
        pkgs = [{'name': x} for x in ('bld/python', 'bld/sh', 'bld/box')]

        for p in self.mngr.load_packages(pkgs):
            yield p
            yield from p.iter_all_runtime_depends()

    @cu.cached_method
    def iter_all_build_depends(self):
        return list(flt(self.calc_all_build_depends())) + self.iter_all_runtime_depends()

    def iter_build_commands(self):
        yield {
            'in_dir': [x.out_dir for x in self.iter_all_build_depends()],
            'out_dir': [self.out_dir],
            'cmd': [self.build_cmd()],
            'cache': False,
            'pool': 'cpu',
        }

    def buildable(self):
        return True

    def build_script(self):
        descr = {
            'pkgs': self.pkgs,
            'links': [p.out_dir for p in self.iter_all_runtime_depends()],
        }

        meta = base64.b64encode(json.dumps(descr).encode()).decode()

        return self.mngr.env.get_template('//die/realm.py').render(meta=meta)

    def build_cmd(self):
        return {
            'args': ['python3'],
            'stdin': self.build_script(),
            'env': {
                'out': self.out_dir,
                'PATH': ':'.join((x.out_dir + '/bin' for x in self.iter_all_build_depends())),
            },
        }

    def prepare(self):
        cg.run(self.mngr.config.ops, [self])

        return Realm(self.mngr, self.pkg_name, self.out_dir)


class BaseRealm:
    def __init__(self, mngr, name, meta):
        self.mngr = mngr
        self.name = name
        self.meta = meta

    @property
    def pkgs(self):
        return self.meta['pkgs']

    @property
    def links(self):
        return self.meta['links']

    def new_version(self, pkgs):
        return prepare_realm(self.mngr, self.name, pkgs)

    def mut(self, patch):
        res = {
            'flags': self.pkgs['flags'],
            'list': collapse_pkgs(self.pkgs['list'] + patch)
        }

        return self.new_version(res)

    @property
    def managed_path(self):
        return realm_path(self.mngr, self.name)

    def uninstall(self):
        os.unlink(self.managed_path)


class Realm(BaseRealm):
    def __init__(self, mngr, name, path):
        self.path = path

        with open(os.path.join(path, 'touch'), 'r') as f:
            pass

        with open(os.path.join(path, 'meta.json'), 'r') as f:
            meta = json.loads(f.read())

        BaseRealm.__init__(self, mngr, name, meta)

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


def load_realm(mngr, name):
    return Realm(mngr, name, os.readlink(realm_path(mngr, name)))


def prepare_realm(mngr, name, pkgs):
    assert '/' not in name

    return RealmCtx(mngr, name, pkgs).prepare()


def empty_meta():
    return {
        'pkgs': {
            'list': [],
            'flags': {},
        },
        'links': [],
    }


class NewRealm(BaseRealm):
    def __init__(self, mngr, name):
        BaseRealm.__init__(self, mngr, name, empty_meta())


def new_realm(mngr, name):
    return NewRealm(mngr, name)
