{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://gitlab.com/AOMediaCodec/SVT-AV1/-/archive/v1.6.0/SVT-AV1-v1.6.0.tar.bz2
sha:c6b49111a2d4c5113f1ada0c2f716d94bd4a8db704623d453066826401ecdab5
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
