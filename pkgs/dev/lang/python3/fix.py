import json
import sys
import os


patch = """
        import json

        if os.environ.get('DUMP'):
            print(json.dumps([x.__dict__ for x in extensions], sort_keys=True, indent=4))
            sys.stdout.flush()
            os._exit(0)
"""


def build_descr(el):
    name = el['name']

    if name == '_ctypes':
        return '_ctypes _ctypes/_ctypes.c _ctypes/callbacks.c _ctypes/callproc.c _ctypes/stgdict.c _ctypes/cfield.c _ctypes/malloc_closure.c -DPy_BUILD_CORE_MODULE'

    skip = False

    if name.startswith('_test'):
        skip = True

    if name in ('_tkinter', '_decimal', 'audioop'):
        skip = True

    if skip:
        return '*disabled*\n' + name + '\n*static*\n'

    sources = []
    cflags = []
    ldflags = []

    cflags.extend(el['extra_compile_args'])
    ldflags.extend(el['extra_link_args'])

    def fix_inc(i):
        if '/Modules' in i:
            return '-I$(srcdir)' + i[i.find('/Modules'):]

        return i

    def flt_wl(l):
        for x in l:
            if 'h_path' in x:
                pass
            else:
                yield x

    def flt_wl_1(l):
        return list(flt_wl(l))

    for x in el['include_dirs']:
        if '/usr' in x:
            pass
        else:
            cflags.append(fix_inc(('-I' + x).replace('-IMo', '-I$(srcdir)/Mo')))

    for x in el['libraries']:
        cflags.append('-l' + x)

    for x in el['sources']:
        sources.append(x)

    for x in el['extra_objects']:
        sources.append(os.path.basename(x)[:-2] + '.c')

    cflags_d = []

    for x in el['define_macros']:
        if x[1]:
            cflags_d.append('#define ' + str(x[0]) + ' ' + str(x[1]))
        else:
            cflags_d.append('#define ' + str(x[0]))

    def flt_lib(ll):
        for l in ll:
            if l == '-lm':
                pass
            else:
                if l == '-l:libmpdec.so.2':
                    yield '-lmpdec'
                else:
                    yield l

    if cflags_d:
        add = '\n'.join(cflags_d) + '\n\n'

        for s in sources:
            s = 'Modules/' + s

            with open(s, 'r') as f:
                data = add + f.read()

            with open(s, 'w') as f:
                f.write(data)

    return ' '.join([name] + flt_wl_1(sources) + flt_wl_1(list(flt_lib(cflags))) + flt_wl_1(list(flt_lib(ldflags))))


def apply_patch(path, p, line):
    with open(path) as f:
        data = f.read()

    def iter():
        for ll in data.split('\n'):
            if line in ll:
                yield p

            yield ll

    data = '\n'.join(iter())

    with open(path, 'w') as f:
        f.write(data)


def main():
    if sys.argv[1] == 'patch':
        return apply_patch(sys.argv[2], patch, '# move ctypes to the end')

    with open(sys.argv[1]) as f:
        data = f.read()
        data = json.loads(data[data.find('['):])

    print('*static*')

    for el in data:
        print(build_descr(el))


if __name__ == '__main__':
    main()
