import shlex
import subprocess

import core.lex as cc
import core.repo as cr
import core.utils as cu
import core.config as cf
import core.manager as cm


def group_realms(l):
    d = []

    for x in l:
        kind, op, v = x

        if d and d[-1][2]['r'] != v['r']:
            yield d
            d = []

        d.append(x)

    if d:
        yield d


def prepare(ctx, args):
    mngr = cm.Manager(cf.config_from(ctx))

    for d in group_realms(cc.lex(args)):
        yield mngr.ensure_realm(d[0][2]['r']).mut(d)


def cli_mut(ctx):
    for r in prepare(ctx, ctx['args']):
        r.install()


def cli_let(ctx):
    list(prepare(ctx, ctx['args']))


def cli_run(ctx):
    args = ctx['args']

    for r in prepare(ctx, ['ephemeral'] + args[:args.index('--')]):
        cmd = f'. {r.path}/env; ' + shlex.join(args[args.index('--') + 1:])

        return subprocess.check_call(cmd, shell=True)


def cli_build(ctx):
    list(prepare(ctx, ['ephemeral'] + ctx['args']))


def cli_list(ctx):
    repo = cr.Repo(cf.config_from(ctx))

    if ctx['args']:
        for a in ctx['args']:
            for x in repo.load_realm(a).pkgs['list']:
                print(x)
    else:
        for r in repo.list_realms():
            print(r)


def cli_purge(ctx):
    mngr = cm.Manager(cf.config_from(ctx))

    for r in ctx['args']:
        cr.Repo(mngr.config).load_realm(r).to_rw(mngr).uninstall()
