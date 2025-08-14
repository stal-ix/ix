{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
glfw
{% endblock %}

{% block version %}
3.5.0
{% endblock %}

{% block fetch %}
https://github.com/glfw/glfw/archive/refs/tags/{{self.version().strip()}}.tar.gz
1abba4007c81bb3c21dad0f1cfff65cf71a5f92d1421016ce7eb236c7458ba9f
{% endblock %}

{% block lib_deps %}
lib/c
lib/opengl
lib/wayland
lib/xkb/common
lib/vulkan/loader
lib/vulkan/headers
{% endblock %}

{% block bld_libs %}
lib/kernel
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
