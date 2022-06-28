{% extends '//die/meson.sh' %}

{% block fetch %}
https://github.com/Novum/vkQuake/archive/refs/tags/1.20.0.tar.gz
sha:2ff682a4b289607c56200d9d0920e3a360fe1b8aeb8cb39d4e0f4b460f4ad744
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

{% block patch %}
sed -e 's|.*define.*MAX_THREAD_STACK_ALLOC_SIZE.*|#define MAX_THREAD_STACK_ALLOC_SIZE 0|' -i Quake/mem.h
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp $(find ${tmp} -type f -name vkquake) ${out}/bin/
{% endblock %}
