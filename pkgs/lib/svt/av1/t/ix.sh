{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://gitlab.com/AOMediaCodec/SVT-AV1/-/archive/v1.8.0/SVT-AV1-v1.8.0.tar.bz2
sha:41c7183be99a2c72656b15fba4005e46c998cd346418503ed296c5abe6482e47
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
{% if x86_64 %}
bin/nasm
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

{% block setup %}
{% if mingw32 %}
export CFLAGS="-msse4.1 -mavx -mavx2 ${CFLAGS}"
{% endif %}
{% endblock  %}
