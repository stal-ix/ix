{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/Novum/vkQuake/archive/refs/tags/1.30.1.tar.gz
sha:b88d3dfc869d89820766e2dd18bdadb9681adfc4c9d05e09cbbebcc17ef1d150
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
