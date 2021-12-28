{% extends '//lib/llvm/t/mix.sh' %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
dev/tool/python
{% endblock %}

{% block cmake_flags %}
{{super()}}

LLVM_ENABLE_PROJECTS=
LLVM_BUILD_TOOLS=OFF
LLVM_BUILD_UTILS=OFF
{% endblock %}

{% block cmake_srcdir %}
llvm
{% endblock %}
