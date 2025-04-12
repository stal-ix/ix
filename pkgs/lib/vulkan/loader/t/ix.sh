{% extends '//die/c/cmake.sh' %}

{% block version %}
1.3.296.0
{% endblock %}

{% block fetch %}
https://github.com/KhronosGroup/Vulkan-Loader/archive/refs/tags/vulkan-sdk-{{self.version().strip()}}.tar.gz
sha:924b439421c30513f59dfd360cb1309639c1522de28608eb64c9d79581e44c72
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
