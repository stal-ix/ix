{% extends '//die/proxy.sh' %}

{% block fix_deps %}
["bld/glib"]
{% endblock %}

{% block install %}
mkdir -p ${out}/fix
cat << EOF > ${out}/fix/glib_compile_schemas.sh
if test -d share/glib-2.0/schemas; then
    glib-compile-schemas --allow-any-name share/glib-2.0/schemas
fi
EOF
{% endblock %}
