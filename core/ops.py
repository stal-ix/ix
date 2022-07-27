import os
import getpass


def construct(cfg, kind=None):
    if not kind:
        if getpass.getuser() == 'ix':
            kind = 'local'

    if not kind:
        kind = os.environ.get('IX_EXEC_KIND', None)

    if not kind:
        if os.path.isfile('/bin/assemble'):
            kind = 'system'

    if not kind:
        kind = 'local'

    if kind == 'local':
        import core.ops_loc as o

        return o.Ops(cfg)

    import core.ops_sys as o

    return o.Ops(cfg)
