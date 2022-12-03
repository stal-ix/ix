{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/Novum/vkQuake/archive/refs/tags/1.22.1.tar.gz
sha:bc6a5e2d91f67e3288ff3dbfd202465049414bb42e5b80d3e4cbc8aa38a0898f
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
{% endblock %}

{% block bld_tool %}
bin/glslang
bld/spirv/tools
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp $(find ${tmp} -type f -name vkquake) ${out}/bin/
{% endblock %}
