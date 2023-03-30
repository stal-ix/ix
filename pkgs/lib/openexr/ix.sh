{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/AcademySoftwareFoundation/openexr/archive/refs/tags/v3.1.7.tar.gz
sha:78dbca39115a1c526e6728588753955ee75fa7f5bb1a6e238bed5b6d66f91fd7
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
