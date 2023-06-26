{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/AcademySoftwareFoundation/openexr/archive/refs/tags/v3.1.9.tar.gz
sha:103e902d3902800ab07b5f3a298be7afd2755312737b2cdbfa01326ff99dac07
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/imath
{% endblock %}

{% block cmake_flags %}
OPENEXR_INSTALL_EXAMPLES=OFF
{% endblock %}
