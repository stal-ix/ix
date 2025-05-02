import os


def cli_recache(ctx):
    ctx['args'] = ['recache'] + ctx['args']
    cli_tool(ctx)


def cli_tool(ctx):
    args = ctx['args']

    if not args:
        args = ['list']

    pkgs = os.path.dirname(ctx['binary'])
    where = os.path.join(pkgs, 'pkgs', 'die', 'scripts')
    script = os.path.join(where, 'runner')
    env = os.environ.copy()
    env.pop('SSL_CERT_FILE')
    env['IX_PKGS_ROOT'] = pkgs
    env['IX_BINARY'] = ctx['binary']
    env['IX_WHERE'] = where
    env['IX_DIR'] = os.path.dirname(ctx['binary'])
    os.execvpe(script, [script] + args, env)
