{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
fastfetch
{% endblock %}

{% block version %}
2.67.1
{% endblock %}

{% block fetch %}
https://github.com/fastfetch-cli/fastfetch/archive/refs/tags/{{self.version().strip()}}.tar.gz
52489550d1fdeac8bde8b3442064e3bc78d28fda752a171dc46a6cd97454f237
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
