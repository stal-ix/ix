import json
import itertools
import subprocess

import core.utils as cu


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


def flt_duplicates(nodes):
    hset = set()

    for n in nodes:
        h = cu.struct_hash(n)

        if h not in hset:
            hset.add(h)

            yield n


def validate(nodes):
    yield from nodes

    return

    for n in nodes:
        net = n.get('net', False)

        if net:
            if 'predict' not in n:
                raise Exception(f'invalid node {n}')

        yield n


def build_graph(n):
    return {
        'nodes': list(validate(flt_duplicates(build_commands(n)))),
        'targets': [(x.out_dir + '/touch') for x in n],
        'pools': {
            'cpu': 4,
            'other': 16,
        },
    }


def run(ops, nodes):
    ops.execute_graph(build_graph(nodes))
