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

    v['flags'] = cu.dict_dict_update(flags, v.get('flags', {}))

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
        self.manager = mngr

        selector = json.loads(json.dumps(selector))

        if 'flags' not in selector:
            selector['flags'] = {}

        flags = selector['flags']

        if 'target' not in flags:
            flags['target'] = self.config.platform['target']

        if 'kind' not in flags:
            flags['kind'] = 'bin'

        print(selector)

        self.selector = selector
        self.descr = cr.RenderContext(self).render()

        self.uid = cu.struct_hash([
            self.descr['bld']['fetch'],
            self.descr['bld']['script'],
            self.pkg_name,
            self.config.store_dir,
            [x.out_dir for x in self.iter_all_build_depends()],
        ])

        self.out_dir = self.config.store_dir + '/' + self.uid + '-' + self.pkg_name

    @property
    def pkg_name(self):
        return self.name.removesuffix('.sh').removesuffix('/mix').replace('/', '-').replace('.', '-').replace('_', '-').replace('--', '-') + '-' + self.flags['kind']

    @property
    def flags(self):
        return self.selector['flags']

    @property
    def name(self):
        return self.selector['name']

    @property
    def config(self):
        return self.manager.config

    @property
    def target(self):
        return self.flags['target']

    @property
    def host(self):
        return self.config.platform['host']

    def lib_flags(self):
        return cu.dict_dict_update(self.flags, {'kind': 'lib'})

    def bin_flags(self):
        return {'target': self.host, 'kind': 'bin'}

    def load_package(self, n, flags):
        try:
            n['name']
        except TypeError:
            n = make_selector(n, flags)

        return self.load_package_impl(n)

    def load_package_impl(self, selector):
        try:
            return self.manager.load_package(selector)
        except FileNotFoundError:
            raise ce.Error(f'can not load dependant package {fmt_sel(selector)} of {fmt_sel(self.selector)}')

    def load_packages(self, l, flags):
        return (self.load_package(x, flags) for x in l)

    def bld_lib_deps(self):
        yield from self.descr['bld']['libs']

        for p in self.bld_bin_closure():
            yield from p.descr['ind']['deps']

    def visit(self, lst, flags, childf):
        return visit_lst(self.load_packages(lst, flags), childf)

    @cu.cached_method
    def bld_bin_closure(self):
        return self.visit(self.descr['bld']['deps'], self.bin_flags(), lambda x: x.run_closure())

    @cu.cached_method
    def lib_closure(self):
        return self.visit(self.descr['lib']['deps'], self.lib_flags(), lambda x: x.lib_closure())

    @cu.cached_method
    def bld_lib_closure(self):
        return self.visit(self.bld_lib_deps(), self.lib_flags(), lambda x: x.lib_closure())

    def iter_all_build_depends(self):
        return buildable(itertools.chain(self.bld_bin_closure(), reversed(self.bld_lib_closure())))

    @cu.cached_method
    def run_closure(self):
        return self.visit(self.descr['run']['deps'], self.bin_flags(), lambda x: x.run_closure())

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
