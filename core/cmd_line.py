import os
import getpass

import core.error as ce


def tok(p):
    if p.startswith('--'):
        p = p[2:]

        if '=' in p:
            k, v = p.split('=', maxsplit=1)
        else:
            k, v = p, '1'

        if v == '-':
            return ('f', '-', (k, v))

        return ('f', '+', (k, v))

    if p[0] == '+':
        op = '+'
        p = p[1:]
    elif p[0] == '-':
        op = '-'
        p = p[1:]
    else:
        op = '+'

    if '/'in p:
        return ('p', op, p)

    return ('r', op, p)


def lex(pkgs):
    rlm = getpass.getuser()
    pkg = None

    for p in pkgs:
        kind, op, v = tok(p)

        if kind == 'r':
            rlm = v
            pkg = None

            yield ('r', op, {'r': v})
        elif kind == 'p':
            pkg = v

            yield ('p', op, {'r': rlm, 'p': v})
        elif kind == 'f':
            yield ('f', op, {'r': rlm, 'p': pkg, 'f': v})
