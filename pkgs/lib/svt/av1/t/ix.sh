{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://gitlab.com/AOMediaCodec/SVT-AV1/-/archive/v1.2.0/SVT-AV1-v1.2.0.tar.bz2
sha:0f2a060febc652f45d0daddc79d7e09ecb53747fe5feafe32e85a410017e8512
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
