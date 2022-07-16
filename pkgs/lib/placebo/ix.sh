{% extends '//die/meson.sh' %}

{% block fetch %}
https://code.videolan.org/videolan/libplacebo/-/archive/v4.208.0/libplacebo-v4.208.0.tar.bz2
sha:c89a80655ab375e4809415bb597c638607fc150fa6f6bb830dd502fec7f0ba95
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
