{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/fastfetch-cli/fastfetch/archive/refs/tags/2.3.4.tar.gz
sha:d132775816685b7ceb8adc164af50a96814af879b97ad453efca3a285efd96d0
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/glib
lib/dbus
lib/chafa
#lib/opengl
lib/sqlite/3
lib/wayland/dl
#lib/drivers/3d
lib/pciutils/dl
lib/image/magick
lib/vulkan/headers
lib/vulkan/loader/dl
{% endblock %}

{% block patch %}
sed -e 's|command-not-found|mc|' -i src/detection/terminalshell/terminalshell_linux.c
{% endblock %}
