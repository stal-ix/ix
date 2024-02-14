{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/AcademySoftwareFoundation/openexr/archive/refs/tags/v3.2.2.tar.gz
sha:65de6459c245a4977ce4d7777e70b30d7ef48ec38e0cfb10205706ca50a8bf2e
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
