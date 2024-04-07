{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/fastfetch-cli/fastfetch/archive/refs/tags/2.9.1.tar.gz
sha:f22bb197095ea80c4aa17e1d4b5e0dd6e79234f4a18f427691c7e6f93a812ac8
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
