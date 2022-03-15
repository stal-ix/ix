{% extends '//lib/poppler/t/mix.sh' %}

{% block cmake_flags %}
{{super()}}
ENABLE_UTILS=OFF
{% endblock %}

{% block env_lib %}
export CPPFLAGS="-I${out}/include/poppler \${CPPFLAGS}"
{% endblock %}
