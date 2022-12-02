{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/Novum/vkQuake/archive/refs/tags/1.22.0.tar.gz
sha:a5bc9e2a357ffd95e39553b3a1463d8e4174a3ba9fa30016bf457f9f71326428
{% endblock %}

{% block bld_libs %}
lib/c
lib/mad
lib/sdl/2
lib/kernel
lib/xiph/ogg
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
