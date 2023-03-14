{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/Novum/vkQuake/archive/refs/tags/1.30.0.tar.gz
sha:073c8f0f734d0c2404e3ad77e9c8be56048b7569b147a1a0e5b292bf964a9a60
{% endblock %}

{% block bld_libs %}
lib/c
lib/mad
lib/opus
lib/sdl/2
lib/kernel
lib/xiph/ogg
lib/opus/file
lib/xiph/flac
lib/drivers/3d
lib/xiph/vorbis
lib/vulkan/loader
bin/quake/1/vk/dl
{% endblock %}

{% block bld_tool %}
bin/glslang
bld/spirv/tools
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp $(find ${tmp} -type f -name vkquake) ${out}/bin/
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
