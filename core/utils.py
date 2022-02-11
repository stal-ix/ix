import os
import time
import json
import string
import hashlib
import functools
import itertools


def copy_dict(d):
    return json.loads(json.dumps(d))


def iter_dir_1(w):
    for a, b, c in os.walk(w):
        for x in c:
            yield os.path.join(a, x)

        for x in b:
            dl = os.path.join(a, x)

            if os.path.islink(dl):
                yield dl


def iter_dir(w):
    for x in iter_dir_1(w):
        yield x[len(w) + 1:]


B62 = string.digits + string.ascii_letters + string.ascii_letters.upper()


def b62(b):
    i = int.from_bytes(b, 'little')

    while i:
        yield B62[i % len(B62)]

        i //= len(B62)


def string_hash(s):
    return ''.join(b62(hashlib.md5(s.encode()).digest()))[:16]


def struct_hash(d):
    return string_hash(json.dumps(d, sort_keys=True))


def iter_uniq_list(lst):
    v = set()

    for l in lst:
        k = struct_hash(l)

        if k not in v:
            v.add(k)

            yield l


def uniq_list(lst):
    return list(iter_uniq_list(lst))


def singleton(f):
    @functools.wraps(f)
    def wrapper():
        while True:
            try:
                return f.__cache__
            except AttributeError:
                pass

            f.__cache__ = f()

    return wrapper


def cached_method(m):
    key = '__cache_' + m.__name__ + '__'

    @functools.wraps(m)
    def wrapper(self):
        while True:
            try:
                return self.__dict__[key]
            except KeyError:
                pass

            self.__dict__[key] = m(self)

    return wrapper


def dict_update(d, v):
    return dict(itertools.chain(d.items(), v))


def dict_dict_update(d1, d2):
    return dict_update(d1, d2.items())


SS = time.time()


def step(s):
    pass
    # print(f'{time.time() - SS} {s}')


def sync():
    os.system('sync')
