import core.utils as cu
import core.manager as cm
import core.cmd_line as cc


def group_realms(l):
    res = {}

    for x in l:
        r = x['realm']

        if r in res:
            res[r].append(x)
        else:
            res[r] = [x]

    return res


def cli_mut(ctx):
    mngr = cm.Manager(cc.config_from(ctx))

    if args := ctx['args']:
        for realm, diff in group_realms(cc.parse_pkgs_lst(args)).items():
            mngr.ensure_realm(realm).mut(diff).install()
    else:
        for r in mngr.iter_realms():
            r.mut([]).install()


def cli_list(ctx):
    mngr = cm.Manager(cc.config_from(ctx))

    if ctx['args']:
        for a in ctx['args']:
            for x in mngr.load_realm(a).pkgs:
                print(x)
    else:
        for r in mngr.list_realms():
            print(r)


def cli_purge(ctx):
    cm.Manager(cc.config_from(ctx)).load_realm(ctx['args'][0]).uninstall()
