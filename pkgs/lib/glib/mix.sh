{% extends '//lib/glib/pure/mix.sh' %}

{% block lib_deps %}
lib/mimetype
{{super()}}
{% endblock %}

{% block patch %}
patch -p1 << EOF
{% include '00.diff' %}
EOF

patch -p1 << EOF
{% include '01.diff' %}
EOF

sed -e 's|.*fast && result_.*||' \
    -e 's|sniff_length = _.*|sniff_length = 1024;| ' \
    -i gio/glocalfileinfo.c
{% endblock %}
