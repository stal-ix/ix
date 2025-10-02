{% extends '//bin/intel/clc/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/llvm/21
lib/spirv/llvm/translator/21
{% endblock %}
