{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/KhronosGroup/Vulkan-Loader/archive/refs/tags/vulkan-sdk-1.3.275.0.tar.gz
sha:f49a2653cd592439c5b4b987ffa0b2577b7fa72b7d344d7a2a89f7d6cb2b342e
{% endblock %}

{% block lib_deps %}
lib/c
{% if linux %}
lib/wayland
{% endif %}
lib/vulkan/headers
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}

{% block cmake_flags %}
BUILD_WSI_XCB_SUPPORT=NO
BUILD_WSI_XLIB_SUPPORT=NO
{% endblock %}

{% block build_flags %}
# werror
shut_up
wrap_cc
{% endblock %}
