{% extends '//die/c/meson.sh' %}

{% block lib_deps %}
lib/c
lib/epoxy
lib/opengl
lib/lcms/2
lib/execinfo
{% if vulkan %}
lib/glslang
lib/shaderc
lib/vulkan/loader
lib/vulkan/headers
lib/spirv/tools
lib/spirv/headers
{% endif %}
{% endblock %}

{% block bld_libs %}
pip/Mako
lib/vulkan/headers
{% endblock %}

{% block bld_tool %}
bld/python
{% if vulkan %}
bin/glslang
{% endif %}
{% endblock %}

{% block meson_flags %}
opengl=enabled
{% if vulkan %}
vulkan=enabled
vulkan-registry="${VK_XML}"
{% else %}
vulkan=disabled
{% endif %}
{% endblock %}
