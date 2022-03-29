{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/kcat/openal-soft/archive/refs/tags/1.21.1.tar.gz
sha:8ac17e4e3b32c1af3d5508acfffb838640669b4274606b7892aa796ca9d7467f
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
