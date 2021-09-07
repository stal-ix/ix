import os
import json
import hashlib
import functools


def iter_dir(w):
    for a, b, c in os.walk(w):
        for x in c:
            yield os.path.join(a[len(w) + 1:], x)


def string_hash(s):
    return hashlib.md5(s.encode('utf-8')).hexdigest()


def struct_hash(d):
    return string_hash(json.dumps(d, sort_keys=True))


def iter_uniq_list(lst):
    v = set()

    for l in lst:
        if l not in v:
            v.add(l)

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
