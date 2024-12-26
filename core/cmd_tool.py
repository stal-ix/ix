import os


def cli_tool(ctx):
    args = ctx['args']
    pkgs = os.path.dirname(ctx['binary'])
    where = os.path.join(pkgs, 'pkgs', 'die', 'scripts')
    script = os.path.join(where, 'runner')
    env = os.environ.copy()
    env.pop('SSL_CERT_FILE')
    env['IX_PKGS_ROOT'] = pkgs
    env['IX_BINARY'] = ctx['binary']
    env['IX_WHERE'] = where
    os.execvpe(script, [script] + args, env)
