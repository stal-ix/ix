{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/fastfetch-cli/fastfetch/archive/refs/tags/2.10.2.tar.gz
sha:2e52c6152b750fc13248dcb5d55259474ced25e4b09fdc965ea310565c1cdf78
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

{% block patch %}
sed -e 's|command-not-found|mc|' -i src/detection/terminalshell/terminalshell_linux.c
{% endblock %}
