{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/fastfetch-cli/fastfetch/archive/refs/tags/2.29.0.tar.gz
sha:c3fcccf9502e41c76c30e89530820bf1c7719257e5624bfa5fa77e6627ecb602
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
