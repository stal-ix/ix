{% extends 't/ix.sh' %}

{% block env %}
{{super()}}
export CPPFLAGS="-I${out}/include/libsoup-3.0 \${CPPFLAGS}"
{% endblock %}
