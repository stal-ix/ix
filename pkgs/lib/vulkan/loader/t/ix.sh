{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
Vulkan-Loader
{% endblock %}

{% block version %}
1.4.363.0
{% endblock %}

{% block fetch %}
https://github.com/KhronosGroup/Vulkan-Loader/archive/refs/tags/vulkan-sdk-{{self.version().strip()}}.tar.gz
941eff558fc74f248745fb7df367640cf89a8457f216dae498a74ae14b6ba6f7
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
