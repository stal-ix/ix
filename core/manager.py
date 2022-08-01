import core.j2 as cj
import core.vfs as cv
import core.utils as cu
import core.realm as cr
import core.package as cp


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

    def load_hard(self, p):
        return self.cached(p.uid, lambda: p)

    def load_package(self, s):
        return self.cached(cu.struct_hash(s), lambda: self.load_hard(cp.Package(s, self)))

    def load_packages(self, ss):
        for s in ss:
            yield self.load_package(s)

    def ensure_realm(self, name):
        try:
            return cr.load_realm_ro(self.config, name).to_rw(self)
        except FileNotFoundError as e:
            print(f'create new realm {name}')

        return cr.new_realm(self, name)
