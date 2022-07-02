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
