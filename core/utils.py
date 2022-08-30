import os
import time
import json
import string
import hashlib
import functools
import itertools


def copy_dict(d):
    return json.loads(json.dumps(d))


B62 = string.digits + string.ascii_letters


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


def uniq_p(it):
    s = set()

    for p in it:
        if p.uid not in s:
            s.add(p.uid)

            if p.buildable():
                yield p


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


def sync():
    os.system('sync')


def gen_sym():
    for x in string.ascii_letters + string.digits:
        yield x, x

    yield '+', '-plus-'


def replace_all(s, a, b):
    while a in s:
        s = s.replace(a, b)

    return s


SYM = dict(gen_sym())


def canon_name(n):
    return replace_all(''.join(SYM.get(x, '-') for x in n), '--', '-').rstrip('-').lower()
