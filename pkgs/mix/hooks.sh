{% macro install_glib_schemas() %} (
cd ${out}

mkdir -p share/glib-2.0/schemas; cd share/glib-2.0/schemas

IFS=':'; for x in ${MIX_T_DIR}; do
    cp ${x}/share/glib-2.0/schemas/*.xml ./ || true
done
) {% endmacro %}

{% macro wrap_xdg_binary(name) %} (
cd ${out}

mkdir -p fix; cd fix

cat << EOF > {{name}}.sh
mv bin/{{name}} bin/{{name}}-real
cp -L bin/{{name}}-real bin/{{name}}
sed -e "s|__realm__|\${PWD}|" -i bin/{{name}}
EOF

cd ..

mkdir -p bin; cd bin

mv {{name}} {{name}}-bin

cat << EOF > {{name}}
#!/usr/bin/env sh
export PATH="__realm__/bin:\${PATH}"
export XDG_DATA_DIRS="__realm__/share:${out}/share:\${XDG_DATA_DIRS}"
{% if caller %}
{{caller()}}
{% endif %}
exec "${out}/bin/{{name}}-bin" "\$@"
EOF

chmod +x {{name}}
) {% endmacro %}

{% macro wrap_c_compiler(name) %} (
C=$(which {{name}})

cat << EOF > {{name}}
#!$(which python3)

import os
import sys
import subprocess

def it_args():
    for x in sys.argv:
        if x:
            if x[0] == '@':
                yield from open(x[1:], 'r').read().split()
            else:
                yield x

args = list(it_args())

def flt_objs():
    for x in args:
        if x.endswith('.o') or x.endswith('.a'):
            yield x

def link1(x, objs):
    if '/' in x:
        try:
            os.makedirs(os.path.dirname(x))
        except OSError:
            pass

    if objs:
        subprocess.check_call(['llvm-ar', 'qL', x] + objs)
    else:
        open(x, 'w')

def link(objs):
    for x in args:
        if '-Wl' in x:
            continue

        if '.so' in x:
            link1(x, objs)

if '-c' in args:
    pass
elif '-shared' in str(args):
    link(list(flt_objs()))
    sys.exit(0)

if '-P' in args or '-E' in args:
    arg0 = 'clang-cpp'
else:
    arg0 = "${C}"

subprocess.check_call([arg0] + args[1:])
EOF

chmod +x {{name}}
) {% endmacro %}
