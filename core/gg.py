import json
import subprocess

import core.execute as ce


def rec_node_1(n):
    yield n

    for x in n.iter_all_build_depends():
        yield x['p']

    yield from n.iter_all_runtime_depends()


def rec_nodes(n):
    v = set()

    def visit(x):
        if x.uid not in v:
            v.add(x.uid)

            yield x

            for y in rec_node_1(x):
                yield from visit(y)

    for x in n:
        yield from visit(x)


def build_graph(n):
    def it():
        for x in rec_nodes(n):
            if x.buildable():
                yield from x.iter_build_commands()

    return {
        'nodes': list(it()),
        'targets': [(x.out_dir + '/touch') for x in n],
    }


def execute_graph(graph):
    stdin = json.dumps(graph).encode('utf-8')
    cmd = ['/bin/doas', 'mix', '-T', '/bin/mix', 'execute']

    try:
        subprocess.run(cmd, shell=False, input=stdin, check=True, env={'DROPBEAR_PASSWORD': ''})
    except FileNotFoundError:
        ce.execute(graph)
