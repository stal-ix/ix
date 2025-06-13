{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
Vulkan-Loader
{% endblock %}

{% block version %}
1.4.313.0
{% endblock %}

{% block fetch %}
https://github.com/KhronosGroup/Vulkan-Loader/archive/refs/tags/vulkan-sdk-{{self.version().strip()}}.tar.gz
c736fa79d974c3513f5573b74249ed002aab59f1d15d1c13fc1d00644830869a
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
