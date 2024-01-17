{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/fastfetch-cli/fastfetch/archive/refs/tags/2.6.0.tar.gz
sha:f9e18b6b0291679fa2c9f934bbb18a849c9c5b37d93c803a91f7e8ef40cecf6b
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
