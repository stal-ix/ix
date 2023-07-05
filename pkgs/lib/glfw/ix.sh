{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/glfw/glfw/archive/refs/tags/3.3.8.tar.gz
sha:f30f42e05f11e5fc62483e513b0488d5bceeab7d9c5da0ffe2252ad81816c713
{% endblock %}

{% block lib_deps %}
lib/c
lib/opengl
lib/wayland
lib/xkbcommon
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
