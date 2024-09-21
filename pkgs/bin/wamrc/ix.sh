{% extends '//lib/iwasm/ix.sh' %}

{% block unpack %}
{{super()}}
cd wamr-compiler
{% endblock %}

{% block bld_libs %}
{{super()}}
lib/llvm/19
{% endblock %}

{% block cmake_flags %}
{{super()}}
WAMR_BUILD_WITH_CUSTOM_LLVM=ON
{% endblock %}
