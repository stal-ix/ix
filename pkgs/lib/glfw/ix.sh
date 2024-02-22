{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/glfw/glfw/archive/refs/tags/3.3.10.tar.gz
sha:4ff18a3377da465386374d8127e7b7349b685288cb8e17122f7e1179f73769d5
{% endblock %}

{% block lib_deps %}
lib/c
lib/opengl
lib/wayland
lib/xkb/common
lib/vulkan/loader
lib/vulkan/headers
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
GLFW_USE_WAYLAND=ON
{% endblock %}
