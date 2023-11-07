{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/fastfetch-cli/fastfetch/archive/refs/tags/2.2.2.tar.gz
sha:bac9e3b3eed4e42eec0995cc02cd6602a4e2742bb3c6fd7a53c83e083077ebdf
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
