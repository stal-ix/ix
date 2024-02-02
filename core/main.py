import core.utils as cu

import os
import sys
import random
import profile
import importlib
import subprocess

import core.error as ce


CLIS = [
    ('core.cmd_realm', 'mut', False),
    ('core.cmd_realm', 'let', False),
    ('core.cmd_realm', 'run', False),
    ('core.cmd_realm', 'list', False),
    ('core.cmd_realm', 'purge', False),
    ('core.cmd_realm', 'build', False),
    ('core.cmd_gc', 'gc', False),
    ('core.cmd_tool', 'tool', False),
    ('core.cmd_misc', 'misc_extract', True),
    ('core.cmd_misc', 'misc_fetch', True),
    ('core.cmd_misc', 'misc_link', True),
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


def main_func(args, binary, seed):
    if args and '/' in args[0]:
        args = args[1:]

    hndl = find_handler(args)

    if not hndl:
        try:
            return main_func(['tool'] + args, binary, seed)
        except IndexError:
            pass
        except FileNotFoundError:
            pass

        print_help()
        sys.exit(1)

    k, v, a = hndl

    ctx = {
        'args': a,
        'binary': binary,
        'seed': seed,
    }

    def run():
        mod = importlib.import_module(k)
        mod.__dict__['cli_' + v](ctx)

    # profile.runctx('run()', locals(), globals())
    run()


def main(argv, ix, seed):
    random.seed(seed)

    try:
        main_func(argv[1:], ix, seed)
    except subprocess.CalledProcessError as e:
        return e.returncode
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
