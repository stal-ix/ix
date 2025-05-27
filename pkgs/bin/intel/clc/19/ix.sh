{% extends '//bin/intel/clc/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/llvm/19
lib/spirv/llvm/translator/19
{% endblock %}
