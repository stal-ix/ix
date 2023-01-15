{% extends '//lib/compiler_rt/builtins/14/ix.sh' %}

{% block fetch %}
{% include '//lib/llvm/15/ver.sh' %}
{% endblock %}

{% block cpp_defines %}
{{super()}}
{% if target.arch == 'riscv64' %}
__NR_riscv_flush_icache=0
{% endif %}
{% endblock %}
