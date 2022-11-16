{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/kcat/openal-soft/archive/refs/tags/1.22.2.tar.gz
sha:3e58f3d4458f5ee850039b1a6b4dac2343b3a5985a6a2e7ae2d143369c5b8135
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/sndio
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block cmake_flags %}
ALSOFT_DLOPEN=OFF
ALSOFT_EXAMPLES=OFF
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
