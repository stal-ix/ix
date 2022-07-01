{% extends '//die/meson.sh' %}

{% block fetch %}
https://github.com/Novum/vkQuake/archive/refs/tags/1.20.1.tar.gz
sha:81ec663afba5d88e298d27cfeef5cdf40bc1aeb1d6683f13ae32021701543283
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

{# https://github.com/Novum/vkQuake/issues/500 #}

{% block patch %}
sed -e 's|Mem_InitThread|Mem_InitThread_|' -i Quake/mem.c

cat << EOF >> Quake/mem.c
void Mem_InitThread() {
    max_thread_stack_alloc_size = 0;
}
EOF
{% endblock %}
