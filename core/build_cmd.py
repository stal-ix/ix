import core.gg as cg
import core.cmd_line as cc
import core.manager as cm


def parse_kind(n):
    return {
        'lib': 'lib',
        'aux': 'aux',
        'etc': 'aux',
    }.get(n[:n.index('/')], 'bin')


def cli_build(ctx):
    config, pkgs = cc.parse_pkgs(ctx)

    for p in pkgs:
        f = p['flags']

        if 'kind' not in f:
            f['kind'] = parse_kind(p['name'])

    cg.run(config.ops, list(cm.Manager(config).load_packages(pkgs)))
