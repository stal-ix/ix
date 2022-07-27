import os
import time
import shutil
import random

import core.j2 as cj
import core.vfs as cv
import core.repo as cre
import core.error as er
import core.utils as cu
import core.realm as cr
import core.package as cp


class Manager:
    def __init__(self, config):
        self.cache = {}
        self.config = config
        self.env = cj.Env(cv.vfs(config.where))

    def load_impl(self, sel):
        return cp.Package(sel, self)

    def load_hard(self, p):
        u = p.uid

        while True:
            try:
                return self.cache[u]
            except KeyError:
                self.cache[u] = p

    def load_package(self, selector):
        key = cu.struct_hash(selector)

        while True:
            try:
                return self.cache[key]
            except KeyError:
                self.cache[key] = self.load_hard(self.load_impl(selector))

    def load_packages(self, ss):
        for s in ss:
            yield self.load_package(s)

    def ensure_realm(self, name):
        try:
            return cr.load_realm_ro(self.config, name).to_rw(self)
        except FileNotFoundError as e:
            print(f'create new realm {name}')

        return cr.new_realm(self, name)
