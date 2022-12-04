{% extends '//lib/poppler/t/ix.sh' %}

{% block cmake_flags %}
{{super()}}
ENABLE_UTILS=OFF
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/poppler \${CPPFLAGS}"
{% endblock %}
