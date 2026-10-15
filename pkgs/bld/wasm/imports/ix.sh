{# wasm-imports: prints the import and export sections of a wasm module;
   with --none it fails when the module imports anything, which is how a
   wasm32-none package proves in its test block that it is pure #}

{% extends '//die/gen.sh' %}

{% block run_deps %}
bld/python
{% endblock %}

{% block install %}
cd ${out}; mkdir bin; cd bin

cat << 'EOF' > wasm-imports
#!/usr/bin/env python3

import sys

KINDS = ['func', 'table', 'memory', 'global', 'tag']


def leb(b, i):
    r = s = 0

    while True:
        c = b[i]
        i += 1
        r |= (c & 0x7f) << s
        s += 7

        if not c & 0x80:
            return r, i


def name(b, i):
    n, i = leb(b, i)

    return b[i:i + n].decode(), i + n


def limits(b, i):
    flags = b[i]
    i += 1
    _, i = leb(b, i)

    if flags & 1:
        _, i = leb(b, i)

    return i


def sections(b):
    if b[:4] != b'\x00asm':
        raise SystemExit('not a wasm module')

    i = 8

    while i < len(b):
        sid = b[i]
        size, j = leb(b, i + 1)
        yield sid, b[j:j + size]
        i = j + size


def imports(body):
    n, i = leb(body, 0)

    for _ in range(n):
        mod, i = name(body, i)
        nm, i = name(body, i)
        kind = body[i]
        i += 1

        if kind == 0:
            _, i = leb(body, i)
        elif kind == 1:
            i = limits(body, i + 1)
        elif kind == 2:
            i = limits(body, i)
        elif kind == 3:
            i += 2
        else:
            i += 3

        yield mod, nm, KINDS[kind]


def exports(body):
    n, i = leb(body, 0)

    for _ in range(n):
        nm, i = name(body, i)
        kind = body[i]
        _, i = leb(body, i + 1)

        yield nm, KINDS[kind]


def main():
    args = sys.argv[1:]
    none = '--none' in args
    paths = [a for a in args if a != '--none']

    if not paths:
        raise SystemExit('usage: wasm-imports [--none] module.wasm')

    bad = 0

    for path in paths:
        with open(path, 'rb') as f:
            b = f.read()

        imp = []
        exp = []

        for sid, body in sections(b):
            if sid == 2:
                imp = list(imports(body))
            elif sid == 7:
                exp = list(exports(body))

        print(path)
        print('  imports:', len(imp))

        for mod, nm, kind in imp:
            print('    ', kind, mod + '.' + nm)

        print('  exports:', len(exp))

        for nm, kind in exp:
            print('    ', kind, nm)

        if none and imp:
            print('  ERROR: a pure module must not import anything')
            bad += 1

    return 1 if bad else 0


if __name__ == '__main__':
    sys.exit(main())
EOF

chmod +x *
{% endblock %}
