import os
import json
import getpass


def construct_impl(cfg, kind):
    if not kind:
        if getpass.getuser() == 'ix':
            kind = 'local'

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

    import core.ops_sys as o

    return o.Ops(cfg)


class Dump:
    def __init__(self, slave):
        self.slave = slave

    def execute_graph(self, graph):
        print(json.dumps(graph, indent=4, sort_keys=True))

    def __getattr__(self, name):
        return getattr(self.slave, name)


def construct(cfg, kind=None):
    res = construct_impl(cfg, kind)

    if os.environ.get('IX_DUMP_GRAPH', None):
        res = Dump(res)

    return res
