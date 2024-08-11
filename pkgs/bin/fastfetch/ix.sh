{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/fastfetch-cli/fastfetch/archive/refs/tags/2.21.1.tar.gz
sha:67afc33bc1ad321cecf9e4c6f22b09d85020d0beacb10c31008d1111a6a72b70
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
{% endblock %}
