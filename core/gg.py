import json
import itertools
import subprocess

import core.execute as ce


def rec_node(n):
    return itertools.chain([n], n.iter_all_build_depends(), n.iter_all_runtime_depends())


def rec_nodes(n):
    v = set()

    def visit(x):
        if x.uid not in v:
            v.add(x.uid)

            yield x

            for y in rec_node(x):
                yield from visit(y)

    for x in n:
        yield from visit(x)


def build_commands(nodes):
    for x in rec_nodes(nodes):
        if x.buildable():
            yield from x.iter_build_commands()


def build_graph(n):
    return {
        'nodes': list(build_commands(n)),
        'targets': [(x.out_dir + '/touch') for x in n],
    }


def run(ops, nodes):
    ops.execute_graph(build_graph(nodes))
