import os
import sys
import code
import runpy
import argparse

sys.dont_write_bytecode = True

def parse_args_2(argv):
    class AP(argparse.ArgumentParser):
        def error(self, message):
            raise Eception(message)

    ap = AP(exit_on_error=False, add_help=False)

    for x in ('b', 'bb', 'B', 'd', 'E', 'i', 'I', 'O', 'O0', 'P', 'q', 's', 'S', 'u', 'v', 'V'):
        ap.add_argument(f'-{x}', dest=x, required=False, default=False, action='store_true')

    ap.add_argument('-c', dest='command', default=None)
    ap.add_argument('-m', dest='module', default=None)
    ap.add_argument('-W', dest='warn', default=[], action='append')
    ap.add_argument('-X', dest='opt', default=[], action='append')

    return ap.parse_args(argv)

def parse_args_1(argv, rest):
    args = parse_args_2(argv)
    args.rest = rest

    return args

def parse_args_max(argv):
    for l in reversed(range(0, len(argv) + 1)):
        try:
            return parse_args_1(argv[:l], argv[l:])
        except Exception:
            pass

    return parse_args_1(argv, [])

def parse_args(argv):
    args = parse_args_max(argv)

    args.file = None

    if args.module:
        pass
    elif args.command:
        pass
    elif args.rest:
        args.file = args.rest[0]
        args.rest = args.rest[1:]

    return args

def run_code(s):
    exec(s, globals(), globals())

def main(args):
    if args.command:
        run_code(args.command)
    elif args.module:
        runpy.run_module(args.module, run_name='__main__')
    elif args.file:
        runpy.run_path(args.file, run_name='__main__')
    else:
        if sys.stdin.isatty():
            code.interact(banner=args.banner, exitmsg='')
            os._exit(0)
        else:
            run_code(sys.stdin.read())

if __name__ == '__main__':
    args = parse_args(sys.argv[1:])
    sys.argv = [sys.argv[0]] + args.rest

    if args.q:
        args.banner = ''
    else:
        args.banner = None

    if args.i:
        try:
            try:
                main(args)
            except Exception as e:
                print(e, file=sys.stderr)
        finally:
            code.interact(banner=args.banner, exitmsg='')
    else:
        main(args)
