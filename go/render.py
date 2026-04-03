#!/usr/bin/env python3

"""
Jinja2 template renderer for Go build system.
Reads JSON requests from stdin (one per line), writes JSON responses to stdout.

Request: {"name": "lib/c/ix.sh", "flags": {"target": {...}, "kind": "lib", ...}}
Response: {"descr": {...}, "boot": true/false}
Error: {"error": "message"}
"""

import sys
import os
import json

me = os.path.normpath(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

sys.path.insert(0, me)
sys.path.insert(0, os.path.join(me, 'deps', 'jinja-3.1.2', 'src'))
sys.path.insert(0, os.path.join(me, 'deps', 'markupsafe-2.1.1', 'src'))
sys.setrecursionlimit(10000)
sys.dont_write_bytecode = True

import core.j2 as cj
import core.vfs as cv
import core.utils as cu
import core.config as cf
import core.error as ce
import core.render_ctx as cr


class FakePackage:
    """Minimal package-like object for RenderContext."""
    def __init__(self, name, flags, manager, config):
        self.selector = {'name': name, 'flags': flags}
        self._name = name
        self.flags_ = flags
        self.manager = manager
        self.config = config

    @property
    def host(self):
        return self.config.host

    @property
    def name(self):
        return self._name

    @property
    def flags(self):
        return self.flags_

    @property
    def norm_name(self):
        n = self._name
        if n.endswith('.sh'):
            n = n[:-3]
        if n.endswith('/ix'):
            n = n[:-3]
        return n

    @property
    def uniq_id(self):
        return self.calc_pkg_name().replace('-', '_')

    def calc_pkg_name(self):
        k = self.flags_.get('kind', 'lib')
        n = self.norm_name
        idx = n.find('/')
        if idx >= 0:
            n = n[idx + 1:]
        return cu.canon_name(f'{k}-{n}')

    def load_package(self, p, flags):
        # intro() support - return a fake with out_dir
        return FakeIntro(p, flags, self.manager, self.config)


class FakeIntro:
    """Fake package returned by intro() - just needs out_dir."""
    def __init__(self, name, flags, manager, config):
        if isinstance(name, dict):
            self._name = name.get('name', '')
            self._flags = name.get('flags', {})
        else:
            self._name = name
            self._flags = flags
        self.manager = manager
        self.config = config

    @property
    def out_dir(self):
        return f'__intro__{self._name}'


def main():
    config = cf.config_from({'binary': os.path.join(me, 'ix')})
    overlays = cf.find_pkg_dirs(os.path.join(me, 'ix'))
    fs = cj.Loader(cv.UFS(overlays))
    env = cj.Env(fs)

    # Write host config
    sys.stdout.write(json.dumps({'host': config.host}) + '\n')
    sys.stdout.flush()

    for line in sys.stdin:
        line = line.strip()
        if not line:
            continue

        try:
            req = json.loads(line)
            name = req['name']
            flags = req['flags']

            pkg = FakePackage(name, flags, type('M', (), {'fs': fs, 'env': env, 'config': config})(), config)
            rc = cr.RenderContext(pkg)
            descr, args = rc.render()

            resp = {
                'descr': descr,
                'boot': bool(args.get('boot', False)),
            }
            sys.stdout.write(json.dumps(resp) + '\n')
        except Exception as e:
            sys.stdout.write(json.dumps({'error': str(e)}) + '\n')

        sys.stdout.flush()


if __name__ == '__main__':
    main()
