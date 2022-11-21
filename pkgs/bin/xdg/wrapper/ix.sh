{% extends '//die/wrapper.sh' %}

{% block wrapper %}
{{prefix}}
{% endblock %}

{% block wrapper_env %}
export XDG_DATA_DIRS="__realm__/share:\${XDG_DATA_DIRS}"
{% endblock %}

{% block install %}
{{super()}}
cat << EOF > ${out}/fix/glib-compile-schemas.sh
if test -d share/glib-2.0/schemas; then
    glib-compile-schemas share/glib-2.0/schemas
fi
EOF
{% endblock %}
