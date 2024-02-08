{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/KhronosGroup/Vulkan-Loader/archive/refs/tags/vulkan-sdk-1.3.268.0.tar.gz
sha:404fa621f1ab2731bcc68bcbff64d8c6de322faad2d87f9198641bd37255fd39
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
