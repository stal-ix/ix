{% extends '//lib/glib/pure/mix.sh' %}

{% block patch %}
patch -p1 << EOF
{% include '00.diff' %}
EOF
{% endblock %}
