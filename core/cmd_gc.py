import core.config as cf


def cli_gc(ctx):
    if args := ctx['args']:
        kind = args
    else:
        kind = ['lib', 'bin', 'lnk', 'aux', 'rlm', 'set', 'pip']

    cf.config_from(ctx).ops.gc(kind)
