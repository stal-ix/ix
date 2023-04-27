{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://gitlab.com/AOMediaCodec/SVT-AV1/-/archive/v1.5.0/SVT-AV1-v1.5.0.tar.bz2
sha:a649b071906fb840df19fb0e2ec97c04fde82c8ed64dfb8662f625cb8bc6245e
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
