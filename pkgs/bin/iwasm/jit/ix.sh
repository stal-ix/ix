{% extends '//bin/iwasm/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/llvm/15
{% endblock %}

{% block cmake_flags %}
{{super()}}
WAMR_BUILD_JIT=ON
{% endblock %}
