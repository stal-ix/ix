{% extends '//lib/llvm/t/mix.sh' %}

{% block lib_deps %}
lib/c++/mix.sh
{% endblock %}

{% block bld_tool %}
dev/tool/python/mix.sh
{% endblock %}

{% block cmake_flags %}
{{super()}}

-DLLVM_ENABLE_PROJECTS=
-DLLVM_BUILD_TOOLS=OFF
-DLLVM_BUILD_UTILS=OFF
{% endblock %}

{% block cmake_srcdir %}
llvm
{% endblock %}
