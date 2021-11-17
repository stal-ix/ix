import os
import json
import itertools

import core.utils as cu
import core.error as ce
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


def make_selector(v, flags):
    v = parse_pkg_name(v)

    v['flags'] = dict(itertools.chain(flags.items(), v.get('flags', {}).items()))

    return v


def buildable(l):
    for x in l:
        if x.buildable():
            yield x


def visit_lst(lst, f):
    s = set()
    r = []

    def visit(l):
        if l.uid not in s:
            s.add(l.uid)

            for x in f(l):
                visit(x)

            r.append(l)

    for l in lst:
        visit(l)

    return r


class Package:
    def __init__(self, selector, mngr):
        # print(selector)

        self.selector = selector
        self.manager = mngr
        self.descr = cr.RenderContext(self).render()

        self.uid = cu.struct_hash({
            'descr': self.descr,
            'root': self.config.store_dir,
            'deps': [x.out_dir for x in self.iter_all_build_depends()],
        })

        self.out_dir = self.config.store_dir + '/' + self.uid + '-' + self.pkg_name

    @property
    def pkg_name(self):
        return self.name.removesuffix('.sh').removesuffix('/mix').replace('/', '-').replace('.', '-').replace('_', '-').replace('--', '-')

    @property
    def flags(self):
        return self.selector.get('flags', {})

    @property
    def name(self):
        return self.selector['name']

    @property
    def config(self):
        return self.manager.config

    def load_package(self, n, reason):
        try:
            n['name']
        except TypeError:
            if 'lib' in reason:
                n = make_selector(n, self.flags)
            else:
                n = make_selector(n, {})

        return self.load_package_impl(n, reason)

    def load_package_impl(self, selector, reason):
        # print(self.selector, selector, reason)

        try:
            return self.manager.load_package(selector)
        except FileNotFoundError:
            s1 = fmt_sel(selector)
            s2 = fmt_sel(self.selector)

            raise ce.Error(f'can not load dependant package {s1} of {s2}')

    def load_packages(self, l, reason):
        return (self.load_package(x, reason) for x in l)

    def lib_deps(self):
        return self.descr['lib']['deps']

    def bld_lib_deps(self):
        yield from self.lib_deps()
        yield from self.descr['bld']['libs']

        for p in self.bld_bin_closure():
            yield from p.lib_deps()

    @cu.cached_method
    def bld_bin_closure(self):
        return visit_lst(self.load_packages(self.descr['bld']['deps'], "bld bin"), lambda x: x.run_closure())

    @cu.cached_method
    def lib_closure(self):
        return visit_lst(self.load_packages(self.lib_deps(), "lib"), lambda x: x.lib_closure())

    @cu.cached_method
    def bld_lib_closure(self):
        return visit_lst(self.load_packages(self.bld_lib_deps(), "bld lib"), lambda x: x.lib_closure())

    def iter_all_build_depends(self):
        return buildable(itertools.chain(self.bld_bin_closure(), reversed(self.bld_lib_closure())))

    @cu.cached_method
    def run_closure(self):
        return visit_lst(self.load_packages(self.descr['run']['deps'], "run"), lambda x: x.run_closure())

    def iter_all_runtime_depends(self):
        return buildable(self.run_closure())

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
        return not not self.descr['bld']['script']
