import os
import json
import shutil

import core.gg as cg
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


def prepare(ctx, args, realize=True, assemble=True):
    mngr = cm.Manager(cf.config_from(ctx))
    realm_nodes = [mngr.ensure_realm(d[0][2]['r']).mut(d) for d in group_realms(cc.lex(args))]

    if assemble:
        build_nodes = realm_nodes
    else:
        # Skip realm assembly: target the package leaves directly,
        # not the realm root that would `prepare_realm` them all
        # together. Under IX_EXEC_KIND=molot the realm command
        # downloads every dep's result tarball from S3 onto one
        # machine, which is pure I/O for `ix build`'s "did this
        # compile?" check. iter_all_runtime_depends returns the
        # same flattened package set the realm would link, and
        # build_graph's rec_nodes dedup is uid-keyed — so the
        # resulting graph is exactly build_graph(realm_nodes)
        # minus the realm node and its bld/realm toolchain.
        build_nodes = [d for n in realm_nodes for d in n.iter_all_runtime_depends()]

    graph = cg.build_graph(build_nodes)

    if os.environ.get('IX_DUMP_GRAPH', ''):
        print(json.dumps(graph, indent=4, sort_keys=True))

        return

    mngr.config.ops.execute_graph(graph)

    if not realize:
        return

    for n in realm_nodes:
        yield n.from_prepared()


def cli_dep(ctx):
    args = ctx['args']
    mngr = cm.Manager(cf.config_from(ctx))

    for d in cc.lex(args):
        if d[0] == 'p':
            mngr.load_descriptor({'name': d[2]['p']})

    for k in mngr.fs.cache.keys():
        if 'die/' not in k:
            print(cu.strip_prefix(k, '//'))


def cli_mut(ctx):
    for r in list(prepare(ctx, ctx['args'])):
        r.install()


def cli_let(ctx):
    list(prepare(ctx, ctx['args']))


def mine_pkg_by_bin(binary, where):
    for l in open(where + '/pkgs/die/scripts/bins.json').read().split('\n'):
        l = l.strip()

        if not l:
            continue

        rec = json.loads(l)

        if rec['bin'] == binary:
            return rec['ix_pkg_name']

    raise Exception(f'no {binary} binary in IX database')


def cli_run(ctx):
    args = ctx['args']

    if '--' in args:
        pkgs = args[:args.index('--')]
        cmdl = args[args.index('--') + 1:]
    else:
        pkgs = [mine_pkg_by_bin(args[0], os.path.dirname(ctx['binary']))]
        cmdl = args

    for r in reversed(list(prepare(ctx, ['ephemeral'] + pkgs + ['bin/ix/runner']))):
        cmd = ['runner_entry', f'{r.path}/env'] + cmdl
        env = os.environ.copy()
        env['OLDPATH'] = env.get('PATH', '')
        env['PATH'] = f'/nowhere:{r.path}/bin'
        exe = shutil.which(cmd[0], path=env['PATH'])

        return os.execvpe(exe, cmd, env)


def cli_build(ctx):
    # realize=False: don't open the realm output dirs after building
    # (under IX_EXEC_KIND=molot the build artifact lives in S3 and
    # is never extracted into local /ix/store).
    # assemble=False: don't build the realm assembly node either —
    # `ix build` only needs to know each package compiled, not to
    # gather their tarballs into one place. Skipping the realm
    # avoids molot fetching every dep's result.zstd onto the
    # caller's worker.
    list(prepare(ctx, ['ephemeral'] + ctx['args'], realize=False, assemble=False))


def cli_list(ctx):
    repo = cr.Repo(cf.config_from(ctx))

    if ctx['args']:
        for a in ctx['args']:
            for x in repo.load_realm(a).pkgs['list']:
                print(x)
    else:
        for r in repo.list_realms():
            repo.load_realm(r)
            print(r)


def cli_purge(ctx):
    mngr = cm.Manager(cf.config_from(ctx))

    for r in ctx['args']:
        cr.Repo(mngr.config).load_realm(r).to_rw(mngr).uninstall()
