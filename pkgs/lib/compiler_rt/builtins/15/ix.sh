{% extends '//lib/compiler_rt/builtins/ix.sh' %}

{% block fetch %}
{% include '//lib/llvm/15/ver.sh' %}
{% endblock %}

{% block cmake_flags %}
{{super()}}
COMPILER_RT_EXCLUDE_ATOMIC_BUILTIN=OFF
{% endblock %}
