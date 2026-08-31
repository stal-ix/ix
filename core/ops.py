import os


def flags_from_env():
    def items():
        for value in os.environ.get('IX_FLAGS', '').split(','):
            name, separator, argument = value.partition('=')

            if name:
                yield name, argument if separator else '1'

    result = dict(items())

    # harmless when all_system is off, templates only read these under it,
    # and this way a backend may enable all_system after the fact
    result.setdefault('system_path', os.environ['PATH'])

    for name in ('CPPFLAGS', 'CFLAGS', 'CXXFLAGS', 'LDFLAGS'):
        if value := os.environ.get(name):
            result.setdefault(f'system_{name.lower()}', value)

    if value := os.environ.get('ACLOCAL_PATH'):
        result.setdefault('system_aclocal_path', value)

    return result


def construct(cfg, kind=None):
    if not kind:
        kind = os.environ.get('IX_EXEC_KIND', None)

    if not kind:
        if os.path.isfile('/bin/bin_ix/assemble'):
            kind = 'system'
        elif os.path.isfile('/bin/assemble'):
            kind = 'system'

    if not kind:
        kind = 'local'

    if kind == 'local':
        import core.ops_loc as o

        return o.Ops(cfg)

    if kind == 'fake':
        import core.ops_fake as o

        return o.Ops()

    if kind == 'molot':
        import core.ops_molot as o

        return o.Ops(cfg)

    import core.ops_sys as o

    return o.Ops(cfg)
