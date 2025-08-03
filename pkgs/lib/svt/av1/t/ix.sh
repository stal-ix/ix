{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
SVT-AV1
{% endblock %}

{% block version %}
3.1.0
{% endblock %}

{% block fetch %}
https://gitlab.com/AOMediaCodec/SVT-AV1/-/archive/v{{self.version().strip()}}/SVT-AV1-v{{self.version().strip()}}.tar.bz2
8231b63ea6c50bae46a019908786ebfa2696e5743487270538f3c25fddfa215a
{% endblock %}

{% block lib_deps %}
lib/c
lib/cpu/info
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
USE_CPUINFO=SYSTEM
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
