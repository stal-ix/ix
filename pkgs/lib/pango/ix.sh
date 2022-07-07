{% extends 't/ix.sh' %}

{% block env %}
export CPPFLAGS="-I${out}/include/pango-1.0 \${CPPFLAGS}"
{% endblock %}
