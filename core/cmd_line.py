import os
import getpass

import core.error as ce
import core.config as cc


def config_from(ctx):
    binary = ctx['binary']
    where = os.path.join(os.path.dirname(binary), 'pkgs')
    root = os.environ.get('IX_ROOT', '/ix')

    return cc.Config(binary, where, root)


def parse_pkgs_lst(pkgs):
    cur = None

    for p in [getpass.getuser()] + pkgs:
        if p.startswith('--'):
            p = p[2:]

            if '=' in p:
                k, v = p.split('=', maxsplit=1)
            else:
                k, v = p, '1'

            cur['flags'][k] = v
        elif '/'not in p:
            if cur:
                yield cur

            cur = {
                'realm': p,
                'name': '',
                'op': '+',
                'flags': {},
            }
        else:
            if cur:
                yield cur

            if p[0] == '+':
                op = '+'
                p = p[1:]
            elif p[0] == '-':
                op = '-'
                p = p[1:]
            else:
                op = '+'

            cur = {
                'realm': cur['realm'],
                'name': p,
                'op': op,
                'flags': {},
            }

    if cur:
        yield cur


def parse_pkgs(ctx):
    return config_from(ctx), list(parse_pkgs_lst(ctx['args']))
