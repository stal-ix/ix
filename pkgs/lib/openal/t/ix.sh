{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/kcat/openal-soft/archive/refs/tags/1.22.1.tar.gz
sha:be771f9a8b3c9f283e71d7a9e3dc29a8f8fd3b25263b228d61fbcc638ec8a629
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
