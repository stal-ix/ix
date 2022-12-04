import sys


COL = {
    'r': 31,
    'g': 32,
    'y': 33,
    'b': 34,
}


def col(v, color='r', bright=False):
    n = COL[color]

    if bright:
        n += 60

    return f'\x1b[{n}m{v}\x1b[0m'


def log(*args, **kwargs):
    print(col(*args, **kwargs), file=sys.stderr)
