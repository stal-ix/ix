import core.gg as cg
import core.cmd_line as cc
import core.manager as cm


def cli_build(ctx):
    config, pkgs = cc.parse_pkgs(ctx)

    cg.run(config.ops(), list(cm.Manager(config).load_packages(pkgs)))
