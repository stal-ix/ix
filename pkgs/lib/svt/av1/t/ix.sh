{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://gitlab.com/AOMediaCodec/SVT-AV1/-/archive/v1.4.1/SVT-AV1-v1.4.1.tar.bz2
sha:0e988582f315fe76c909accf5e7f81b975c5bd2b850ee760d8e9fac297f70b5d
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
