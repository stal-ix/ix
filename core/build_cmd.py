import core.cmd_line as cc
import core.manager as cm


def cli_build(ctx):
    config, pkgs = cc.parse_pkgs(ctx)

    cm.Manager(config).build_packages(pkgs)
