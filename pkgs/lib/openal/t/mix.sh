{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/kcat/openal-soft/archive/refs/tags/1.22.0.tar.gz
sha:814831a8013d7365dfd1917b27f1fb6e723f3be3fe1c6a7ff4516425d8392f68
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/sndio
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}

{% block cmake_flags %}
ALSOFT_DLOPEN=OFF
ALSOFT_EXAMPLES=OFF
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
