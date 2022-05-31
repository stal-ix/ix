import core.utils as cu

import os
import sys
import profile
import importlib

import core.error as ce


CLIS = [
    ('core.realm_cmd', 'mut', False),
    ('core.realm_cmd', 'list', False),
    ('core.realm_cmd', 'purge', False),

    ('core.build_cmd', 'build', False),

    ('core.gc_cmd', 'gc', False),

    ('core.pypi_cmd', 'pypi_update', True),

    ('core.misc_cmd', 'misc_extract', True),
    ('core.misc_cmd', 'misc_chksum', True),
    ('core.misc_cmd', 'misc_runpy', True),
    ('core.misc_cmd', 'misc_fetch', True),
    ('core.misc_cmd', 'misc_repl', True),

    ('core.execute', 'execute', True),
]


def find_handler(args):
    sent = '$$'
    xargs = sent.join(args)

    for k, v, _ in CLIS:
        vv = v.replace('_', sent)

        if xargs.startswith(vv):
            a = xargs[len(vv):].split(sent)

            while a and a[0] == '':
                a = a[1:]

            return k, v, a


def print_help():
    print('usage: ix <command>:')

    for k, v, hide in CLIS:
        if not hide:
            print('    ' + v.replace('_', ' '))


def main_func(args, binary):
    if args and '/' in args[0]:
        args = args[1:]

    hndl = find_handler(args)

    if not hndl:
        print_help()
        sys.exit(0)

    k, v, a = hndl

    ctx = {
        'args': a,
        'binary': binary,
    }

    def run():
        cu.step('load module')
        mod = importlib.import_module(k)
        cu.step('done load module')
        mod.__dict__['cli_' + v](ctx)

    # profile.runctx('run()', locals(), globals())
    run()


def main(argv, ix):
    cu.step('start main')

    try:
        main_func(argv[1:], ix)
    except ce.Error as e:
        if e.visible:
            if e.context:
                if '\n' in e.context:
                    print(f'Context:\n{e.context}')
                else:
                    print(f'Context: {e.context}')

            if e.exception:
                print(f'{e.exception.__class__.__name__}: {e.exception}')

            print(f'{e}')

        return 1
    except KeyboardInterrupt:
        return 1

    return 0
