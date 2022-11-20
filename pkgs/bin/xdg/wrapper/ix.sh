{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}; mkdir -p fix; cd fix

cat << EOF > {{name}}
#!/usr/bin/env sh
export XDG_DATA_DIRS="__realm__/share:\${XDG_DATA_DIRS}"
exec {{prefix}} "__realm__/bin/bin_{{name}}/{{name}}" "\$@"
EOF

cat << EOF > "wrap-xdg-{{name}}.sh"
mkdir -p bin/bin_{{name}}
mv bin/{{name}} bin/bin_{{name}}/
cat fix/{{name}} | sed -e "s|__realm__|\${PWD}|" > bin/{{name}}
chmod +x bin/{{name}}
if test -d share/glib-2.0/schemas; then
    glib-compile-schemas share/glib-2.0/schemas
fi
EOF
{% endblock %}
