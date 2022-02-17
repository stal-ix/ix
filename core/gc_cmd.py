import core.cmd_line as cc


def cli_gc(ctx):
    cc.config_from(ctx).ops().gc()
