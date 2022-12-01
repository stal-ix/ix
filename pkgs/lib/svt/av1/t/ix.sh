{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://gitlab.com/AOMediaCodec/SVT-AV1/-/archive/v1.4.0/SVT-AV1-v1.4.0.tar.bz2
sha:d236457eb0b839716b3609db2ce6db62c103a1ca0e9e2eed0239e194b72bdcd0
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bin/nasm
{% endblock %}

{% block cmake_flags %}
ENABLE_NASM=ON
REPRODUCIBLE_BUILDS=ON
{% endblock %}
