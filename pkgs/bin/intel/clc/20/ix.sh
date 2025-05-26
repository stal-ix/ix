{% extends '//bin/intel/clc/t/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/llvm/20
lib/spirv/llvm/translator/20
{% endblock %}
