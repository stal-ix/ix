import core.utils as cu
import core.manager as cm
import core.cmd_line as cc


def cli_realm_mut(ctx):
    if args := ctx['args']:
        mngr = cm.Manager(cc.config_from(ctx))
        mngr.ensure_realm(args[0]).mut(list(cc.parse_pkgs_lst(args[1:]))).install()
    else:
        for r in cm.Manager(cc.config_from(ctx)).iter_realms():
            r.mut([]).install()


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
