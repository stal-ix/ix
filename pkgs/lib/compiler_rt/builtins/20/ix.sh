{% extends '//lib/compiler_rt/builtins/17/ix.sh' %}

{% block fetch %}
{% include '//lib/llvm/20/ver.sh' %}
{% endblock %}

{% block cmake_flags %}
{{super()}}
COMPILER_RT_BUILD_CTX_PROFILE=OFF
{% endblock %}
