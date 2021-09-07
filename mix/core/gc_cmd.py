import shutil

import core.cmd_line as cc
import core.manager as cm


def cli_gc(ctx):
    for x in cm.Manager(cc.config_from(ctx)).iter_garbage():
        print('purge ' + x)

        try:
            shutil.rmtree(x)
        except FileNotFoundError:
            pass
