{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
openal-soft
{% endblock %}

{% block version %}
1.25.2
{% endblock %}

{% block fetch %}
https://github.com/kcat/openal-soft/archive/refs/tags/{{self.version().strip()}}.tar.gz
fb27e5839aa11f0e5b9d33756965291fad5d6909ab928ea1f796f4a1a6877894
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
