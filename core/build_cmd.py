import core.gg as cg
import core.utils as cu
import core.realm as cr
import core.config as cf
import core.manager as cm
import core.cmd_line as cc


def parse_kind(n):
    return {
        'lib': 'lib',
        'aux': 'aux',
        'etc': 'aux',
    }.get(n[:n.index('/')], 'bin')


def iter_buildable(p):
    if p.buildable():
        yield p
    else:
        for x in p.iter_all_runtime_depends():
            if x.buildable():
                yield x


def iter_buildables(pkgs):
    for p in pkgs:
        yield from iter_buildable(p)


def cli_build(ctx):
    config = cf.config_from(ctx)
    pkgs = cr.struct(cc.lex(ctx['args']))

    for p in pkgs:
        f = p['flags']

        if 'kind' not in f:
            f['kind'] = parse_kind(p['name'])

    cg.run(config.ops, list(cu.uniq_p(iter_buildables(cm.Manager(config).load_packages(pkgs)))))
