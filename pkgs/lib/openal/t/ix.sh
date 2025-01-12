{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/kcat/openal-soft/archive/refs/tags/1.24.2.tar.gz
sha:7efd383d70508587fbc146e4c508771a2235a5fc8ae05bf6fe721c20a348bd7c
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
