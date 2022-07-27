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


class Manager(cre.Repo):
    def __init__(self, config):
        cre.Repo.__init__(self, config)
        self._p = {}
        self._x = {}
        self._e = cj.Env(cv.vfs(config.where))

    @property
    def env(self):
        return self._e

    def load_impl(self, sel):
        return cp.Package(sel, self)

    def load_hard(self, p):
        u = p.uid

        while True:
            try:
                return self._p[u]
            except KeyError:
                self._p[u] = p

    def load_package(self, selector):
        key = cu.struct_hash(selector)

        while True:
            try:
                return self._x[key]
            except KeyError:
                self._x[key] = self.load_hard(self.load_impl(selector))

    def load_packages(self, ss):
        for s in ss:
            yield self.load_package(s)
