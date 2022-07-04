{% extends '//die/meson.sh' %}

{% block fetch %}
https://github.com/Novum/vkQuake/archive/refs/tags/1.20.2.tar.gz
sha:d2ce37a4991cd1e59915d40055a86af73c934d7c43dfabeb94d3fd568b73131a
{% endblock %}

{% block bld_libs %}
lib/c
lib/mad
lib/sdl/2
lib/xiph/ogg
lib/xiph/flac
lib/drivers/3d
lib/xiph/vorbis
lib/vulkan/loader
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp $(find ${tmp} -type f -name vkquake) ${out}/bin/
{% endblock %}
