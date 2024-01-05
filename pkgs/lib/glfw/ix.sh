{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/glfw/glfw/archive/refs/tags/3.3.9.tar.gz
sha:a7e7faef424fcb5f83d8faecf9d697a338da7f7a906fc1afbc0e1879ef31bd53
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

{% block patch %}
# imhex segfaults on glfwTerminate
find . -name '*.c' | while read l; do
    sed -e 's|regfree.*|{}|' -i ${l}
done
{% endblock %}
