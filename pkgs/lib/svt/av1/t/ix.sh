{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://gitlab.com/AOMediaCodec/SVT-AV1/-/archive/v1.7.0/SVT-AV1-v1.7.0.tar.bz2
sha:e7995dfc8774f301ac94367a2e5d266dc855cf62ee3d39a635f3a014708e98e1
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
