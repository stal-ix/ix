{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/kcat/openal-soft/archive/refs/tags/1.24.0.tar.gz
sha:d3753f7aba798574ce2dc934e3c47dc655cd7a4652c038f2a860b0e81ff6d3dc
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
