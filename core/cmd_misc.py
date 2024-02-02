import os
import sys
import time
import shutil
import random
import hashlib

import core.log as cl
import core.error as ce
import core.shell_cmd as csc
import core.http_fetch as chf


def prepare_dir(d):
    try:
        shutil.rmtree(d)
    except FileNotFoundError:
        pass

    os.makedirs(d)


def hash(n):
    if n == 'md5':
        return hashlib.md5

    if n == 'sha':
        return hashlib.sha256

    raise Exception(f'unsupported hash name {n}')


def chksum(path, sch):
    func = hash(sch)

    with open(path, 'rb') as f:
        return func(f.read()).hexdigest()


def calc_chksum(path, old_cs):
    if ':' in old_cs:
        sch = old_cs[:old_cs.index(':')]

        return sch + ':' + chksum(path, sch)

    return chksum(path, 'sha')


def cli_misc_extract(ctx):
    for a in ctx['args']:
        if '.zip' in a:
            csc.unzip(a)
        else:
            csc.untar(a)


def cli_misc_fetch(ctx):
    do_fetch(*ctx['args'])


def iter_cached(sha, mirrors):
    for x in mirrors:
        yield os.path.join(x, sha[4:])


def iter_fetch(url, sha, mirrors):
    if sha.startswith('sha:') and len(sha) == 68:
        def it():
            for u in iter_cached(sha, mirrors):
                yield from chf.iter_fetch_url(u)

        for f in list(sorted(list(it()), key=lambda x: random.random()))[:10]:
            yield f, True

    while True:
        for f in chf.iter_fetch_url(url):
            yield f, False


def do_fetch(url, path, sha, *mirrors):
    prepare_dir(os.path.dirname(path))

    tout = 1.0

    for f, best_effort in iter_fetch(url, sha, mirrors):
        try:
            f(path, int(tout))
            return check_md5(path, sha)
        except Exception as e:
            if best_effort:
                print(f'while fetching cached {url}, with {sha}: {e}')
            else:
                if '404' in str(e):
                    raise ce.Error(f'can not fetch {url}: {e}', exception=e)

                if 'checksum' in str(e):
                    raise e

                print(f'while fetching {url}: {e}, will retry after {tout}')
                time.sleep(tout)
                tout = min(tout * 1.2, 60)


def check_md5(path, old_cs):
    new_cs = calc_chksum(path, old_cs)

    if new_cs != old_cs:
        cs_col = cl.col(new_cs, color='r')

        raise ce.Error(f'got {cs_col} checksum, not {old_cs}')


def cli_misc_link(ctx):
    args = ctx['args']

    out = args[0]

    prepare_dir(out)
    os.chdir(out)

    for f in args[1:]:
        print(f'link {f} into {out}')
        os.link(f, os.path.basename(f))
