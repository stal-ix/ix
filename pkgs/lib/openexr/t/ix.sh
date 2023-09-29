{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/AcademySoftwareFoundation/openexr/archive/refs/tags/v3.2.1.tar.gz
sha:61e175aa2203399fb3c8c2288752fbea3c2637680d50b6e306ea5f8ffdd46a9b
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
