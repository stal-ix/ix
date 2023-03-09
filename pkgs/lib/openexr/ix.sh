{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/AcademySoftwareFoundation/openexr/archive/refs/tags/v3.1.6.tar.gz
sha:daa33d93a7b706e27368a162060df0246a7750c39a01a122d33b13f5c45d2029
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
