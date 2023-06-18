{% extends '//lib/iwasm/ix.sh' %}

{% block unpack %}
{{super()}}
cd wamr-compiler
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/llvm/15
{% endblock %}

{% block cmake_flags %}
{{super()}}
WAMR_BUILD_WITH_CUSTOM_LLVM=ON
{% endblock %}
