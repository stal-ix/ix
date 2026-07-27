{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
glfw
{% endblock %}

{% block version %}
a2b295420d899be60c6a27ced21eb172bf51f675
{% endblock %}

{% block fetch %}
https://github.com/pg83/glfw/archive/{{self.version().strip()}}.tar.gz
069e8d784766ea77685f19031a3d0f699afef0f8a9e577c3ec641ccaea26bbcd
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
