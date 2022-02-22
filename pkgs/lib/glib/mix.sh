{% extends '//lib/glib/pure/mix.sh' %}

{% block lib_deps %}
lib/magic/iface
{{super()}}
{% endblock %}

{% block patch %}
patch -p1 << EOF
{% include '00.diff' %}
EOF

patch -p1 << EOF
{% include '01.diff' %}
EOF
{% endblock %}
