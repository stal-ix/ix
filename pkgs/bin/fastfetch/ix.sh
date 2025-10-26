{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
fastfetch
{% endblock %}

{% block version %}
2.54.0
{% endblock %}

{% block fetch %}
https://github.com/fastfetch-cli/fastfetch/archive/refs/tags/{{self.version().strip()}}.tar.gz
e6a0516364bc0a4991a588537ee2abb538b86db41f7d9dff795d49baec990529
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/drm
lib/glib
lib/dbus
lib/chafa
lib/sqlite/3
lib/wayland/dl
lib/pci/utils/dl
lib/image/magick
lib/vulkan/headers
lib/vulkan/loader/dl
{% endblock %}

{% block cmake_flags %}
IS_MUSL=ON
ENABLE_LTO=OFF
{% endblock %}
