import os


def cli_recache(ctx):
    ctx['args'] = ['recache'] + ctx['args']
    cli_tool(ctx)


def cli_tool(ctx):
    args = ctx['args']
    tool = args[0]
    ixbin = ctx['binary']
    pkgs = os.path.dirname(ixbin)

    env = os.environ.copy()

    env.pop('SSL_CERT_FILE')

    env['IX_BINARY'] = ixbin
    env['IX_DIR'] = pkgs

    cmd = [ixbin] + [
        'run',
        '--inherit',
        'bin/ix/tools/' + tool,
        '--',
        'ix_' + tool,
    ] + args[1:]

    os.chdir(pkgs)
    os.execvpe(cmd[0], cmd, env)
