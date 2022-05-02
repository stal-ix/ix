{% extends '//mix/meson.sh' %}

{% block fetch %}
https://code.videolan.org/videolan/libplacebo/-/archive/v4.192.1/libplacebo-v4.192.1.tar.bz2
sha:55447ff067da79f93eee6fef29b592f46eb16fc77340235255986ce9e8f5dbf3
{% endblock %}

{% block lib_deps %}
lib/c
lib/epoxy
lib/lcms2
lib/opengl
lib/glslang
lib/shaderc
lib/execinfo
lib/vulkan/loader
lib/vulkan/headers
lib/vulkan/spirv/tools
lib/vulkan/spirv/headers
{% endblock %}

{% block bld_libs %}
pip/Mako
{% endblock %}

{% block bld_tool %}
bld/python
bin/glslang
{% endblock %}

{% block meson_flags %}
vulkan=enabled
opengl=enabled
vulkan-registry="${VK_XML}"
{% endblock %}
