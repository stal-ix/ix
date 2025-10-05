{% extends '//lib/mesa/t/vulkan/ix.sh' %}

{% block bld_libs %}
lib/llvm
{{super()}}
{% endblock %}

{% block bld_tool %}
pip/ply
{{super()}}
lib/mesa/intel/clc/{{clang_ver or default_clang}}
{% endblock %}

{% block meson_flags %}
{{super()}}
mesa-clc=system
vulkan-drivers=intel
{% endblock %}

{% block env %}
export VULKAN_LIB=${out}/lib/libvulkan_intel.a
{% endblock %}
