{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
fastfetch
{% endblock %}

{% block version %}
2.59.0
{% endblock %}

{% block fetch %}
https://github.com/fastfetch-cli/fastfetch/archive/refs/tags/{{self.version().strip()}}.tar.gz
978e2524d0dc1ff9fd8c89fb24ae5b131af18ff108da82c6d99823712557e499
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
