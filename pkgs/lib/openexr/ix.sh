{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/AcademySoftwareFoundation/openexr/archive/refs/tags/v3.1.10.tar.gz
sha:6e0fd3f0eb1cb907bd3593830ea2b3431b85f22a6f18f99f8cfa099fec70067d
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
