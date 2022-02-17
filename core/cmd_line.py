import os

import core.error as ce
import core.config as cc


def config_from(ctx):
    binary = ctx['binary']
    where = os.path.join(os.path.dirname(binary), 'pkgs')
    root = os.environ.get('MIX_ROOT', '/mix')

    return cc.Config(binary, where, root)


def parse_pkgs(ctx):
    args = ctx['args']
    cfg = config_from(ctx)
    where = cfg.where

    if len(args) > 0:
        pkgs = args
    else:
        pkg = os.getcwd()

        if pkg.startswith(where):
            pkg = pkg[len(where) + 1:]
        else:
            raise ce.Error('should run from pkg dir')

        pkgs = [pkg]

    def iter_pkgs():
        cur = {}

        for p in pkgs:
            if p.startswith('-D'):
                k, v = p[2:].split('=')

                cur['flags'][k] = v
            else:
                if cur:
                    yield cur

                cur = {
                    'name': p,
                    'flags': {
                    },
                }

        if cur:
            yield cur

    return cfg, list(iter_pkgs())
