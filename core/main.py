import os
import sys
import profile
import importlib

import core.error as ce


CLIS = [
    ('core.realm_cmd', 'realm_add', False),
    ('core.realm_cmd', 'realm_remove', False),
    ('core.realm_cmd', 'realm_upgrade', False),
    ('core.realm_cmd', 'realm_list', False),
    ('core.realm_cmd', 'realm_purge', False),

    ('core.pypi_cmd', 'pypi_gen', False),

    ('core.build_cmd', 'build', False),

    ('core.gc_cmd', 'gc', False),

    ('core.misc_cmd', 'misc_untar', True),
    ('core.misc_cmd', 'misc_runpy', True),
    ('core.misc_cmd', 'misc_unzip', True),
    ('core.misc_cmd', 'misc_fetch', True),
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
    print('usage: mix <command>:')

    for k, v, hide in CLIS:
        if not hide:
            print('    ' + v.replace('_', ' '))


def main_func(args, binary):
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
        importlib.import_module(k).__dict__['cli_' + v](ctx)

    #profile.runctx('run()', locals(), globals())
    run()


def main(argv, mix):
    try:
        main_func(argv[1:], mix)
    except ce.Error as e:
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
