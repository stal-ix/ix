{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/kcat/openal-soft/archive/refs/tags/1.23.1.tar.gz
sha:dfddf3a1f61059853c625b7bb03de8433b455f2f79f89548cbcbd5edca3d4a4a
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
{% if x86_64 %}
ALSOFT_REQUIRE_SSE=ON
ALSOFT_REQUIRE_SSE2=ON
ALSOFT_REQUIRE_SSE3=ON
ALSOFT_REQUIRE_SSE4_1=ON
{% endif %}

ALSOFT_BACKEND_OSS=OFF
ALSOFT_BACKEND_SNDIO=ON
ALSOFT_BACKEND_WAVE=ON

ALSOFT_DLOPEN=OFF
ALSOFT_EXAMPLES=OFF
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
