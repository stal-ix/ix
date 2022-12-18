import os
import string
import itertools

import core.sign as cs
import core.utils as cu
import core.error as ce
import core.gen_cmds as cg
import core.render_ctx as cr


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


def rlist(l):
    return list(reversed(list(l)))


def visit_node(n, f, k):
    s = set()

    def v(l):
        kk = k(l)

        if kk not in s:
            s.add(kk)

            for x in rlist(f(l)):
                yield from v(x)

            yield l

    return rlist(v(n))


def visit_lst(l, f):
    def ff(n):
        return f(n) if n else l

    def kk(n):
        return n.uid if n else None

    return visit_node(None, ff, kk)[1:]


def add_kind(k, l):
    return ({'kind': k, 'p': x} for x in l)


def popf1(d, f):
    if f in d:
        d = cu.copy_dict(d)
        d.pop(f)

    return d


def popf(d, *f):
    for x in f:
        d = popf1(d, x)

    return d


ONE_LEVEL = ('setx', 'help', 'verbose', 'stage', 'rebuild', 'nostrip')


def sanitize(flags):
    return popf(flags, *ONE_LEVEL)


def parse_kind(n):
    v = n[:n.index('/')]

    return {
        'bld': 'bin',
        'etc': 'aux',
    }.get(v, v)


def fix_selector(selector, config):
    selector = cu.copy_dict(selector)

    if 'flags' not in selector:
        selector['flags'] = {}

    flags = selector['flags']

    if 'target' not in flags:
        flags['target'] = config.platform['target']

    if 'kind' not in flags:
        flags['kind'] = parse_kind(selector['name'])

    return selector


def remsuf(s, suf):
    if s.endswith(suf):
        return s[:-len(suf)]

    return s


class Package:
    def __init__(self, selector, mngr):
        self.manager = mngr
        self.selector = fix_selector(selector, self.config)
        self.pkg_name = self.calc_pkg_name()
        self.descr = cr.RenderContext(self).render()

        if self.buildable():
            self.uid = cs.UID
            self.uid = list(self.iter_build_commands())[-1]['uid']
        else:
            self.uid = cu.struct_hash(self.selector)

    @property
    def norm_name(self):
        return remsuf(remsuf(self.name, '.sh'), '/ix')

    @property
    def out_dir(self):
        return f'{self.config.store_dir}/{self.uid}-{self.pkg_name}'

    def calc_pkg_name(self):
        k = self.flags['kind']
        n = self.norm_name

        try:
            n = n[n.index('/') + 1:]
        except ValueError:
            pass

        return cu.canon_name(f'{k}-{n}')

    @property
    def uniq_id(self):
        return self.pkg_name.replace('-', '_')

    @property
    def flags(self):
        return self.selector['flags']

    @property
    def name(self):
        res = self.selector['name']

        if not res.endswith('.sh'):
            res = res + '/ix.sh'

        return res

    @property
    def config(self):
        return self.manager.config

    @property
    def target(self):
        return self.flags['target']

    @property
    def host(self):
        return self.config.platform['host']

    def host_lib_flags(self):
        return {'target': self.host, 'kind': 'lib'}

    def target_lib_flags(self):
        return sanitize(cu.dict_dict_update(self.flags, {'kind': 'lib'}))

    def calc_bin_flags(self, target):
        basef = {} if self.buildable() else self.flags

        return cu.dict_dict_update(basef, {'target': target, 'kind': 'bin'})

    def bin_flags(self):
        return self.calc_bin_flags(self.host)

    def load_package(self, n, flags):
        try:
            n['name']
        except TypeError:
            n = make_selector(n, flags)

        return self.load_package_impl(n)

    def load_package_impl(self, sel):
        # TODO(pg): proper local flags
        return self.manager.load_package(sanitize(sel), self.selector)

    def load_packages(self, l, flags):
        return (self.load_package(x, flags) for x in l)

    def bld_lib_deps(self, k):
        yield from self.descr['bld'][k]

        for p in self.bld_bin_closure():
            yield from p.descr['ind']['deps']

    def bld_host_lib_deps(self):
        return self.bld_lib_deps('host_libs')

    def bld_target_lib_deps(self):
        return self.bld_lib_deps('target_libs')

    def visit(self, lst, flags, childf):
        return visit_lst(self.load_packages(lst, flags), childf)

    @cu.cached_method
    def bld_bin_closure(self):
        return self.visit(self.descr['bld']['deps'], self.bin_flags(), lambda x: x.run_closure())

    @cu.cached_method
    def lib_closure(self):
        return self.visit(self.descr['lib']['deps'], self.target_lib_flags(), lambda x: x.lib_closure())

    @cu.cached_method
    def bld_host_lib_closure(self):
        return self.visit(self.bld_host_lib_deps(), self.host_lib_flags(), lambda x: x.lib_closure())

    @cu.cached_method
    def bld_target_lib_closure(self):
        return self.visit(self.bld_target_lib_deps(), self.target_lib_flags(), lambda x: x.lib_closure())

    def bld_lib_closure(self):
        return itertools.chain(self.bld_target_lib_closure(), self.bld_host_lib_closure())

    @cu.cached_method
    def bld_data(self):
        return self.load_data_dep(self.descr['bld']['data'])

    def iter_all_tagged_build_depends(self):
        yield from add_kind('bin', self.bld_bin_closure())
        yield from add_kind('data', self.bld_data())
        yield from add_kind('target lib', self.bld_target_lib_closure())
        yield from add_kind('host lib', self.bld_host_lib_closure())

    def iter_tagged_build_depends(self):
        for x in self.iter_all_tagged_build_depends():
            if x['p'].buildable():
                yield x

    def iter_extra_tools(self):
        if 'sem:' in str(self.descr['bld']['fetch']):
            yield 'bin/semver'

    def iter_extra_build_depends(self):
        # TODO(pg): refac
        return self.visit(self.iter_extra_tools(), self.bin_flags(), lambda x: x.run_closure())

    def iter_all_build_depends_dup(self):
        for x in self.iter_tagged_build_depends():
            yield x['p']

        yield from self.iter_extra_build_depends()

    @cu.cached_method
    def iter_all_build_depends(self):
        return list(cu.uniq_p(self.iter_all_build_depends_dup()))

    @cu.cached_method
    def iter_build_dirs(self):
        return [x.out_dir for x in self.iter_all_build_depends()]

    @cu.cached_method
    def run_deps(self):
        return list(self.load_packages(self.descr['run']['deps'], self.calc_bin_flags(self.target)))

    def load_data_dep(self, l):
        return list(self.load_packages(l, {'target': self.target, 'kind': 'aux'}))

    @cu.cached_method
    def run_data(self):
        return self.load_data_dep(self.descr['run']['data'])

    def all_run_deps(self):
        yield from self.run_deps()
        yield from self.run_data()

        # TODO(pg): think trice about it
        if self.flags['kind'] == 'lib':
            yield from self.lib_closure()

        for p in self.bld_target_lib_closure():
            yield from p.run_data()

    @cu.cached_method
    def run_closure(self):
        return visit_lst(self.all_run_deps(), lambda x: x.run_closure())

    def iter_all_runtime_depends(self):
        return filter(lambda x: x.buildable(), self.run_closure())

    def buildable(self):
        return not not self.descr['bld']['script']

    def iter_build_commands(self):
        return cg.iter_build_commands(self)

    def find_tool(self, name):
        for x in self.iter_all_build_depends():
            if x.norm_name == name:
                return x

        raise Exception(f'can not find {name} for {self.name}')
