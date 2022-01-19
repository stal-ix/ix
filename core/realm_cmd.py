import core.utils as cu
import core.manager as cm
import core.cmd_line as cc


def parse_args(ctx):
    class Args:
        def __init__(self):
            args = ctx['args']
            self.realm = args[0]
            ctx['args'] = args[1:]
            self.config, self.pkgs = cc.parse_pkgs(ctx)

    return Args()


def cli_realm_add(ctx):
    args = parse_args(ctx)

    cm.Manager(args.config).ensure_realm(args.realm).add(args.pkgs).install()


def cli_realm_remove(ctx):
    args = parse_args(ctx)

    cm.Manager(args.config).ensure_realm(args.realm).remove(args.pkgs).install()


def cli_realm_upgrade(ctx):
    cu.step('start upgrade')

    mngr = cm.Manager(cc.config_from(ctx))

    def iter_realms():
        if ctx['args']:
            yield from ctx['args']
        else:
            yield from mngr.list_realms()

    for r in iter_realms():
        cu.step('realm start')
        mngr.load_realm(r).upgrade().install()
        cu.step('realm end')


def cli_realm_list(ctx):
    mngr = cm.Manager(cc.config_from(ctx))

    if ctx['args']:
        for a in ctx['args']:
            for x in mngr.load_realm(a).pkgs:
                print(x)
    else:
        for r in mngr.list_realms():
            print(r)


def cli_realm_purge(ctx):
    cm.Manager(cc.config_from(ctx)).load_realm(ctx['args'][0]).uninstall()
