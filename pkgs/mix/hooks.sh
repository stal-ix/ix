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

if '.so' in str(sys.argv):
    for x in sys.argv:
        if '.so' in x:
            if '/' in x:
                try:
                    os.makedirs(os.path.dirname(x))
                except OSError:
                    pass

                open(x, 'w')

    sys.exit(0)

if '-P' in sys.argv or '-E' in sys.argv:
    arg0 = 'clang-cpp'
else:
    arg0 = "${C}"

subprocess.check_call([arg0] + sys.argv[1:])
EOF

chmod +x {{name}}
) {% endmacro %}
