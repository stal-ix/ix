{% extends '//die/python/bin.sh' %}

{% block bld_libs %}
lib/python
lib/py/extra
{{super()}}
{% endblock %}

{% block entry_point %}python3{% endblock %}

{% block step_unpack %}
cat << EOF > python3
import sys
import code
import runpy
import argparse

sys.dont_write_bytecode = True

def parse_args_2(argv):
    ap = argparse.ArgumentParser(exit_on_error=False)

    for x in ('b', 'bb', 'B', 'd', 'E', 'i', 'I', 'O', 'O0', 'P', 'q', 's', 'S', 'u', 'v', 'V'):
        ap.add_argument(f'-{x}', dest=x, required=False, default=False, action='store_true')

    ap.add_argument('-c', dest='command', default=None)
    ap.add_argument('-m', dest='module', default=None)
    ap.add_argument('-W', dest='warn', default=[], action='append')
    ap.add_argument('-X', dest='opt', default=[], action='append')

    return ap.parse_args(argv)

def parse_args_1(argv):
    err = sys.stderr
    out = sys.stdout

    sys.stderr = None
    sys.stdout = None

    try:
        return parse_args_2(argv)
    finally:
        sys.stderr = err
        sys.stdout = out

def parse_args(argv):
    args = None

    for l in reversed(range(0, len(argv) + 1)):
        try:
            args = parse_args_1(argv[:l])
            args.rest = argv[l:]

            break
        except:
            pass

    if not args:
        args = parse_args_1(argv)

    args.file = None

    if args.module:
        pass
    elif args.command:
        pass
    elif args.rest:
        args.file = args.rest[0]
        args.rest = args.rest[1:]

    return args

if __name__ == '__main__':
    args = parse_args(sys.argv[1:])

    sys.argv = [sys.argv[0]] + args.rest

    def run_code(s):
        exec(s)

    if args.command:
        run_code(args.command)
    elif args.module:
        runpy.run_module(args.module, run_name='__main__')
    elif args.file:
        runpy.run_path(args.file, run_name='__main__')
    else:
        if sys.stdin.isatty():
            code.interact()
        else:
            run_code(sys.stdin.read())
EOF
{% endblock %}

{% block env %}
{{super()}}
export NATIVE_PYTHON=${out}/bin/python3
{% endblock %}
