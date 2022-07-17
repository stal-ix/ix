import core.gg as cg
import core.realm as cr
import core.manager as cm
import core.cmd_line as cc


def parse_kind(n):
    return {
        'lib': 'lib',
        'aux': 'aux',
        'etc': 'aux',
    }.get(n[:n.index('/')], 'bin')


def cli_build(ctx):
    config = cc.config_from(ctx)
    pkgs = cr.struct(cc.lex(ctx['args']))

    for p in pkgs:
        f = p['flags']

        if 'kind' not in f:
            f['kind'] = parse_kind(p['name'])

    cg.run(config.ops, list(cm.Manager(config).load_packages(pkgs)))
