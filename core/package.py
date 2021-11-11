import os
import sys
import jinja2
import itertools
import multiprocessing

import core.utils as cu
import core.error as ce
import core.gen_cmds as cg
import core.render_ctx as cr


def fmt_sel(s):
    return str(s)


def parse_pkg_flags(v):
    def it():
        for x in v.split(','):
            a, b, c = x.partition('=')

            yield a, c

    return dict(it())


def parse_pkg_name(v):
    a, b, c = v.partition('(')

    r = {
        'name': a,
    }

    if b:
        r['flags'] = parse_pkg_flags(c[:-1])

    return r


class Package:
    def __init__(self, selector, mngr):
        self.selector = selector
        self.manager = mngr
        self.descr = cr.RenderContext(self).render()
        self.uid = cu.struct_hash({
            'descr': self.descr,
            'root': self.config.store_dir,
            'deps': [x.out_dir for x in self.iter_all_build_depends()],
        })
        self.out_dir = self.config.store_dir + '/' + self.uid + '-' + os.path.dirname(self.name).replace('/', '-').replace('.', '-')

    @property
    def flags(self):
        return self.selector.get('flags', {})

    @property
    def name(self):
        return self.selector['name']

    @property
    def config(self):
        return self.manager.config

    def load_package(self, selector):
        # print(self.name, selector)

        try:
            return self.manager.load_package(selector)
        except FileNotFoundError:
            s1 = fmt_sel(selector)
            s2 = fmt_sel(self.selector)

            raise ce.Error(f'can not load dependant package {s1} of {s2}')

    def filter_buildable(self, it):
        for n in it:
            if self.load_package(n).buildable():
                yield n

    def make_selector(self, v):
        try:
            v['name']
        except Exception:
            v = parse_pkg_name(v)

        if 'flags' not in v:
            v['flags'] = {}

        v['flags'] = dict(itertools.chain(self.flags.items(), v['flags'].items()))

        return v

    def make_selectors(self, lst):
        return [self.make_selector(x) for x in lst]

    # build
    def build_depends(self):
        return self.make_selectors(self.descr['build']['depends'])

    @cu.cached_method
    def all_build_depends(self):
        def iter_deps():
            yield from self.build_depends()

            for d in self.build_depends():
                yield from self.load_package(d).all_runtime_depends()

        return cu.uniq_list(self.filter_buildable(iter_deps()))

    def iter_all_build_depends(self):
        for d in self.all_build_depends():
            yield self.load_package(d)

    # runtime
    def runtime_depends(self):
        return self.make_selectors(self.descr['runtime']['depends'])

    @cu.cached_method
    def all_runtime_depends(self):
        def iter_deps():
            yield from self.runtime_depends()

            for d in self.runtime_depends():
                yield from self.load_package(d).all_runtime_depends()

        return cu.uniq_list(self.filter_buildable(iter_deps()))

    def iter_all_runtime_depends(self):
        for d in self.all_runtime_depends():
            yield self.load_package(d)

    # all
    def depends(self):
        return self.build_depends() + self.runtime_depends()

    @cu.cached_method
    def all_depends(self):
        def iter_deps():
            for d in self.depends():
                yield d
                yield from self.load_package(d).all_depends()

        return cu.uniq_list(iter_deps())

    def commands(self):
        return list(cg.iter_build_commands(self))

    def install(self, to):
        fr = self.out_dir

        for x in cu.iter_dir(fr):
            if '/' not in x:
                continue

            p = os.path.join(to, x)

            try:
                os.makedirs(os.path.dirname(p))
            except Exception:
                pass

            try:
                os.unlink(p)
            except FileNotFoundError:
                pass

            os.symlink(os.path.join(fr, x), p)

    def buildable(self):
        return not not self.descr['build']['script']
