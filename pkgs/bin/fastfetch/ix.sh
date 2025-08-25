{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
fastfetch
{% endblock %}

{% block version %}
2.50.2
{% endblock %}

{% block fetch %}
https://github.com/fastfetch-cli/fastfetch/archive/refs/tags/{{self.version().strip()}}.tar.gz
e59f2a2bdd5834ef40adb9fb6680820c268ff60ca0534469c5ea4b86775c83db
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
