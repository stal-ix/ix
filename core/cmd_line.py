import os

import core.error as ce
import core.config as cc


def config_from(ctx):
    binary = ctx['binary']
    where = os.path.join(os.path.dirname(binary), 'pkgs')

    return cc.Config(binary, where)


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

    return cfg, [{'name': x} for x in pkgs]
