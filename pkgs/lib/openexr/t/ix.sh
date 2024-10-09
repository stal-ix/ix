{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/AcademySoftwareFoundation/openexr/archive/refs/tags/v3.3.1.tar.gz
sha:58aad2b32c047070a52f1205b309bdae007442e0f983120e4ff57551eb6f10f1
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/imath
lib/deflate
{% endblock %}

{% block cmake_flags %}
OPENEXR_INSTALL_EXAMPLES=OFF
{% endblock %}
