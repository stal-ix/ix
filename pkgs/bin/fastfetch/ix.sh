{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/fastfetch-cli/fastfetch/archive/refs/tags/2.39.0.tar.gz
sha:f07f9a81460b1a30ccb16c8c7b9b8021f8618d307a708b8ed36d439a403db92e
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
