{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://gitlab.com/AOMediaCodec/SVT-AV1/-/archive/v3.0.2/SVT-AV1-v3.0.2.tar.bz2
sha:7548a380cd58a46998ab4f1a02901ef72c37a7c6317c930cde5df2e6349e437b
https://github.com/1480c1/cpuinfo/archive/e649baaa95efeb61517c06cc783287d4942ffe0e.zip
sha:d2cfc3b4120ad2f17a7c6cc43d0547ecfb9f375b7918d723d234100822aa490e
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block step_unpack %}
mkdir src
cd src
extract 1 ${src}/SVT-AV1-v3.0.2.tar.bz2
mkdir -p ${tmp}/obj/_deps/cpuinfo-subbuild/cpuinfo-populate-prefix/src
cp ${src}/e649baaa95efeb61517c06cc783287d4942ffe0e.zip ${tmp}/obj/_deps/cpuinfo-subbuild/cpuinfo-populate-prefix/src
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
