import os


def construct(cfg, kind=None):
    if not kind:
        kind = os.environ.get('IX_EXEC_KIND', None)

    if not kind:
        if os.path.isfile('/bin/bin_ix/assemble'):
            kind = 'system'

    if not kind:
        kind = 'local'

    if kind == 'local':
        import core.ops_loc as o

        return o.Ops(cfg)

    if kind == 'fake':
        import core.ops_fake as o

        return o.Ops()

    import core.ops_sys as o

    return o.Ops(cfg)
