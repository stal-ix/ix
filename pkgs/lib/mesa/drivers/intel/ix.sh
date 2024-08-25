{% extends '//lib/mesa/drivers/llvm/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/clc
bin/llvm/spirv
lib/vulkan/spirv/tools
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/spirv/tools
{% endblock %}
