{% macro install_glib_schemas() %}
(
cd ${out}

mkdir -p share/glib-2.0/schemas; cd share/glib-2.0/schemas

IFS=':'; for x in ${IX_T_DIR}; do
    cp ${x}/share/glib-2.0/schemas/*.xml ./ || true
    cp ${x}/lib/aux/glib-2.0/schemas/*.xml ./ || true
done
)
{% endmacro %}

{% macro wrap_xdg_binary(name, prefix='') %} (
cd ${out}

mkdir -p fix; cd fix

cat << EOF > "wrap-xdg-{{name}}.sh"
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
exec {{prefix}} "${out}/bin/{{name}}-bin" "\$@"
EOF

chmod +x {{name}}
) {% endmacro %}

{% macro wrap_c_compilers() %}
for name in ${CC} ${CXX}; do
    cat << EOF > ${name}
#!$(which sh)
exec wrapcc "$(which ${name})" "\${@}"
EOF

    chmod +x ${name}
done
{% endmacro %}

{% macro gen_pc(name, version) %}
mkdir -p ${out}/lib/pkgconfig

cat << EOF > ${out}/lib/pkgconfig/{{name}}.pc
prefix=${out}
libdir=\${prefix}/lib
includedir=\${prefix}/include

Name: {{name}}
Description: stub pc file for {{name}}
Version: {{version}}
Libs:
Cflags:
EOF
{% endmacro %}

{% macro check_exists(name) %}
mkdir -p ${out}/fix
cat << EOF > "${out}/fix/check-{{name.replace('/', '-')}}.sh"
#!/usr/bin/env sh
test -f {{name}} || (echo 'install package with {{name}}'; exit 1)
EOF
{% endmacro %}

{% macro wrap_sudo_binary(name) %} (
mkdir -p ${out}/fix; cd ${out}/fix

cat << EOF > wrap-sudo-{{name}}.sh
#!/usr/bin/env sh
mv bin/{{name}} bin/{{name}}-bin
mv fix/{{name}}.tmp bin/{{name}}
EOF

cat << EOF > {{name}}.tmp
#!/usr/bin/env sh
exec sudo \$(which {{name}}-bin) "\${@}"
EOF

chmod +x wrap-sudo-{{name}}.sh {{name}}.tmp
) {% endmacro %}
