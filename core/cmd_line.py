import os

import core.error as ce
import core.config as cc


def config_from(ctx):
    binary = ctx['binary']
    where = os.path.join(os.path.dirname(binary), 'pkgs')
    root = os.environ.get('IX_ROOT', '/ix')

    return cc.Config(binary, where, root)


def parse_pkgs_lst(pkgs):
    cur = {}

    for p in pkgs:
        if p.startswith('--'):
            p = p[2:]

            if '=' in p:
                k, v = p.split('=', maxsplit=1)
            else:
                k, v = p, '1'

            cur['flags'][k] = v
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
                'name': p,
                'op': op,
                'flags': {},
            }

    if cur:
        yield cur


def parse_pkgs(ctx):
    return config_from(ctx), list(parse_pkgs_lst(ctx['args']))
