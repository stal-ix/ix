{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/glfw/glfw/releases/download/3.3.7/glfw-3.3.7.zip
sha:4ef0c544a8ace9a6cd0e0aef8250090f89fea1bf96e9fc1d9d6f76386c290c9c
{% endblock %}

{% block lib_deps %}
lib/c
lib/mesa/gl
lib/wayland
lib/mesa/egl
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
