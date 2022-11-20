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
