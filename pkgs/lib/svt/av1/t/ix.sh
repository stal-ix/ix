{% extends '//die/c/cmake.sh' %}

{% block fetch %}
# broke libheif
# https://gitlab.com/AOMediaCodec/SVT-AV1/-/archive/v2.1.0/SVT-AV1-v2.1.0.tar.bz2
# sha:2bfd098770bba185cd1ced8e1ff389837e3dca0d8b5cfb0d97c925a61dbbf955
https://gitlab.com/AOMediaCodec/SVT-AV1/-/archive/v1.8.0/SVT-AV1-v1.8.0.tar.bz2
sha:41c7183be99a2c72656b15fba4005e46c998cd346418503ed296c5abe6482e47
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
{% if x86_64 %}
bld/nasm
{% endif %}
{% if darwin %}
bld/cctools
{% endif %}
{% endblock %}

{% block cmake_flags %}
{% if x86_64 %}
ENABLE_NASM=ON
{% endif %}
REPRODUCIBLE_BUILDS=ON
{% endblock %}

{% block setup_target_flags %}
{% if mingw32 %}
export CFLAGS="-msse4.1 -mavx -mavx2 ${CFLAGS}"
{% endif %}
{% endblock  %}
