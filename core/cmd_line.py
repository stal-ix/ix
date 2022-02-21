import os

import core.error as ce
import core.config as cc


def config_from(ctx):
    binary = ctx['binary']
    where = os.path.join(os.path.dirname(binary), 'pkgs')
    root = os.environ.get('MIX_ROOT', '/mix')

    return cc.Config(binary, where, root)


def parse_pkgs_lst(pkgs):
    cur = {}

    for p in pkgs:
        if p.startswith('--'):
            k, v = p[2:].split('=')

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
