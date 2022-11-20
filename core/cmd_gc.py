import core.config as cf


def cli_gc(ctx):
    cf.config_from(ctx).ops.gc()
