import getpass


def construct(cfg):
    if getpass.getuser() == 'mix':
        import core.ops_loc as o

        return o.Ops(cfg)

    import core.ops_sys as o

    return o.Ops()
