import os
import json
import shutil
import itertools

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


class Realm:
    def __init__(self, mngr, name, path):
        self.name = name
        self.path = path
        self.mngr = mngr

        with open(os.path.join(self.path, 'touch'), 'r') as f:
            pass

        with open(os.path.join(self.path, 'meta.json'), 'r') as f:
            data = f.read()
            # print(data)
            self.meta = json.loads(data)

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
        os.rename(tmp, path)

    def uninstall(self):
        os.unlink(self.managed_path)


def load_realm(mngr, name):
    cu.step('load realm')

    try:
        return Realm(mngr, name, os.readlink(realm_path(mngr, name)))
    finally:
        cu.step('done loadrealm')


def prepare_realm(mngr, name, pkgs):
    cu.step('start iter runtime')
    handles = list(mngr.iter_runtime_packages(pkgs))
    cu.step('start build packages')
    mngr.build_packages([p.selector for p in handles])
    cu.step('done build packages')
    uid = cu.struct_hash([14, name, pkgs] + cu.uniq_list([p.uid for p in handles]))
    path = os.path.join(mngr.config.store_dir, uid)
    touch = os.path.join(path, 'touch')
    meta = os.path.join(path, 'meta.json')

    try:
        return Realm(mngr, name, path)
    except Exception:
        pass

    try:
        shutil.rmtree(path)
    except Exception:
        pass

    os.makedirs(path)

    for p in reversed(handles):
        p.install(path)

    with open(meta, 'w') as f:
        descr = {
            'pkgs': pkgs,
            'links': [p.out_dir for p in handles],
        }

        f.write(json.dumps(descr, indent=4, sort_keys=True))

    with open(touch, 'w') as f:
        pass

    return Realm(mngr, name, path)
