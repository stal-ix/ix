import core.j2 as cj
import core.vfs as cv
import core.utils as cu
import core.realm as cr
import core.error as ce
import core.package as cp


def it_flags(ff):
    for k, v in ff:
        if k not in ('host', 'target'):
            yield f'{k}={v}'


def fmt_sel(s):
    n = s['name']
    f = ', '.join(it_flags(s.get('flags', {}).items()))

    return f'[{n}; {f}]'


class Manager:
    def __init__(self, config):
        self.cache = {}
        self.config = config
        self.env = cj.Env(cv.vfs(config.where))

    def cached(self, key, func):
        while True:
            try:
                return self.cache[key]
            except KeyError:
                self.cache[key] = func()

    def load_package(self, s, sfrom):
        print(fmt_sel(sfrom) + ' -> ' + fmt_sel(s))

        try:
            return self.cached(cu.struct_hash(s), lambda: cp.Package(s, self))
        except FileNotFoundError as fe:
            to = fmt_sel(s)
            fr = fmt_sel(sfrom)

            raise ce.Error(f'can not load dependant package {to} of {fr}', exception=fe)

    def load_packages(self, ss, sfrom):
        for s in ss:
            yield self.load_package(s, sfrom)

    def empty_realm(self, name):
        return cr.new_realm(self, name)

    def ensure_realm(self, name):
        try:
            return cr.load_realm_ro(self.config, name).to_rw(self)
        except FileNotFoundError as e:
            pass

        return self.empty_realm(name)
