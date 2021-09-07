import queue
import threading
import collections


def simple_engine(it, key=lambda x: x):
    by_dep = collections.defaultdict(set)
    by_rdep = collections.defaultdict(set)

    for k, v in it:
        by_dep[k].add(v)
        by_rdep[v].add(k)

    deps = set(by_dep.keys())
    rdeps = set(by_rdep.keys())
    ready = rdeps - deps

    def iter_ready():
        while ready:
            tmp = list(sorted(ready, key=key))

            ready.clear()

            for t in tmp:
                if t is not None:
                    yield t
                else:
                    cb(None)

    def cb(item):
        for k in by_rdep[item]:
            el = by_dep[k]

            el.remove(item)

            if not el:
                by_dep.pop(k)
                ready.add(k)

    return iter_ready, cb


def make_func(d):
    def func():
        return d

    return func


def make_err(n, e):
    def func():
        raise e

    return func


class Builder(object):
    def __init__(self, g):
        self._g = g
        self._bu = {}

        for n in self._g:
            self._bu[n['uid']] = n


    def visit(self):
        r, w = self.engine()

        while tmp := list(r()):
            for i in tmp:
                yield self._bu[i]
                w(i)

    def build(self):
        for n in self.visit():
            self.build_command(n)

    def iter_deps(self):
        for n in self._g:
            for d in n['deps']:
                yield n['uid'], d

    def engine(self):
        return simple_engine(self.iter_deps())

    def build_parallel(self, th):
        r, w = self.engine()

        qi = queue.SimpleQueue()
        qo = queue.SimpleQueue()

        def run_thr():
            while True:
                d = qi.get()
                n = self._bu[d]

                try:
                    self.build_command(n)
                    qo.put(make_func(d))
                except Exception as e:
                    qo.put(make_err(n, e))

        for i in range(0, th):
            t = threading.Thread(target=run_thr)
            t.daemon = True
            t.start()

        v = set()

        while True:
            for i in r():
                qi.put(i)
                v.add(i)

            if not v:
                return

            res = qo.get()()

            w(res)
            v.remove(res)

    def build_command(self, n):
        pass
