{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
glfw
{% endblock %}

{% block version %}
3.4
{% endblock %}

{% block fetch %}
https://github.com/glfw/glfw/archive/refs/tags/{{self.version().strip()}}.tar.gz
c038d34200234d071fae9345bc455e4a8f2f544ab60150765d7704e08f3dac01
{% endblock %}

{# Backport https://github.com/glfw/glfw/commit/bb8048122a8ef5a12e60d2ab3c8586961ae2366c #}
{% block patch %}
patch -p1 << EOF
{% include 'post-empty-event-wayland.patch' %}
EOF
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

{# glfw bundles its own wayland-protocol code and privatizes most of the
   generated interface objects with a _glfw_ prefix — but the fractional-scale
   manager interface leaks unprefixed and collides with a consumer that ships
   its own copy (imway generates the same protocol). rename it private so glfw
   stops exporting it. #}
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
