{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
fastfetch
{% endblock %}

{% block version %}
2.71.0
{% endblock %}

{% block fetch %}
https://github.com/fastfetch-cli/fastfetch/archive/refs/tags/{{self.version().strip()}}.tar.gz
e71d93de41e8e4b2554c36d2ae51758112a21ecf3a8c98605a2c689251e62987
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
