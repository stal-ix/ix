{% extends 't/ix.sh' %}

{% block cmake_flags %}
{{super()}}
PCRE2_BUILD_PCRE2GREP=OFF
{% endblock %}

{% block env %}
{{super()}}
export CPPFLAGS="-DPCRE2_STATIC=1 \${CPPFLAGS}"
{% endblock %}
