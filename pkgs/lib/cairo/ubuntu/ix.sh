{% extends '//lib/cairo/stock/ix.sh' %}

{% block patch %}
{{super()}}

patch -p1 << EOF
{% include '1.diff' %}
EOF

patch -p1 << EOF
{% include '2.diff' %}
EOF
{% endblock %}
