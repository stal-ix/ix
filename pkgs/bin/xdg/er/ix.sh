{% extends '//die/fix/wrapper.sh' %}

{% block wrapper %}
{{prefix}}
{% endblock %}

{% block wrapper_env %}
export PATH="__realm__/bin:\${PATH}"
export XDG_DATA_DIRS="__realm__/share:\${XDG_DATA_DIRS}"
{% endblock %}

{% block install %}
{{super()}}
cat << EOF > ${out}/fix/glib_compile_schemas.sh
if test -d share/glib-2.0/schemas; then
    glib-compile-schemas --allow-any-name share/glib-2.0/schemas
fi
EOF
{% endblock %}
