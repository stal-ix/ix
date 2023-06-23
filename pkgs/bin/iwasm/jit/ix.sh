{% extends '//bin/iwasm/ix.sh' %}

{% block cmake_flags %}
{{super()}}
WAMR_BUILD_JIT=0
WAMR_BUILD_FAST_JIT=1
{% endblock %}
