{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
glfw
{% endblock %}

{% block version %}
33e7d5cc1e949afce2bc03a2f2c6f6b25ef306c1
{% endblock %}

{% block fetch %}
https://github.com/pg83/glfw/archive/{{self.version().strip()}}.tar.gz
8cc51df8b91a50e203c25ac7f3624959d8a910717a9e0e52d1aa86a064473637
{% endblock %}

{% block lib_deps %}
lib/c
lib/wayland
lib/xkb/common
{% if opengl %}
lib/opengl
{% endif %}
{% if vulkan %}
lib/vulkan/loader
lib/vulkan/headers
{% endif %}
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{# The fork privatizes cursor-shape interfaces at source level. The
   fractional-scale manager still leaks unprefixed and collides with consumers
   such as imway that generate their own protocol code. #}
{% block c_rename_symbol %}
wp_fractional_scale_manager_v1_interface
{% endblock %}

{% block bld_tool %}
lib/k/ecm
bld/wayland
{% endblock %}

{% block cmake_flags %}
GLFW_BUILD_DOCS=OFF
GLFW_BUILD_TESTS=OFF
GLFW_BUILD_EXAMPLES=OFF
GLFW_VULKAN_STATIC=ON
GLFW_BUILD_WAYLAND=ON
GLFW_BUILD_X11=OFF
{% endblock %}
