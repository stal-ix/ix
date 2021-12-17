import shutil

import core.cmd_line as cc
import core.manager as cm


def cli_gc(ctx):
    m = cm.Manager(cc.config_from(ctx))

    for x in m.iter_garbage():
        print(f'purge {x}')
        m.collect_garbage(x)

    print('purge trash...')
    shutil.rmtree(m.config.ensure_trash_dir())
