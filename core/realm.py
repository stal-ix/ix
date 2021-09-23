import os
import json
import shutil
import itertools

import core.utils as cu


def realm_path(mngr, name):
    return os.path.join(mngr.config.realm_dir, name)


def dict_update(o, n):
    return dict(itertools.chain(o.items(), n.items()))


def collapse_pkgs(pkgs):
    v = []
    d = {}

    for p in pkgs:
        n = p['name']

        if n in d:
            d[n] = dict_update(d[n], p.get('flags', {}))
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
        # TODO
        raise Exception('unimplemented')

    def upgrade(self):
        return self.new_version(self.pkgs)

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
    return Realm(mngr, name, os.readlink(realm_path(mngr, name)))


def prepare_realm(mngr, name, pkgs):
    mngr.build_packages(pkgs)
    handles = list(mngr.iter_runtime_packages(pkgs))
    uid = cu.struct_hash([10, name, pkgs] + cu.uniq_list([p.uid for p in handles]))
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

    for p in handles:
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
