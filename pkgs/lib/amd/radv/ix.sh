{% extends '//lib/mesa/t/vulkan/ix.sh' %}

{% block meson_flags %}
{{super()}}
llvm=disabled
amd-use-llvm=false
vulkan-drivers=amd
{% endblock %}

{% block env %}
export VULKAN_LIB=${out}/lib/libvulkan_radeon.a
{% endblock %}
