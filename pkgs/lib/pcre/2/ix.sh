{% extends 't/ix.sh' %}

{% block cmake_flags %}
{{super()}}
PCRE2_BUILD_PCRE2GREP=OFF
{% endblock %}
