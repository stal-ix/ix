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

{% block cpp_defines %}
USE_CRT_MALLOC=1
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp $(find ${tmp} -type f -name vkquake) ${out}/bin/
{% endblock %}

{# https://github.com/Novum/vkQuake/issues/500 #}
{# https://github.com/Novum/vkQuake/issues/508 #}

{% block patch %}
(
cat << EOF
#pragma once
EOF

cat Quake/mem.h

cat << EOF
#undef TEMP_ALLOC
#define TEMP_ALLOC(type, var, size) {var = (type*)Mem_Alloc((sizeof(type) * (size)));}
#undef TEMP_FREE
#define TEMP_FREE(var) {Mem_Free(var);}
EOF
) > _

mv _ Quake/mem.h
{% endblock %}
