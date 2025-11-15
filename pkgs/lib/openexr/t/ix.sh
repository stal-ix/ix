{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
openexr
{% endblock %}

{% block version %}
3.4.3
{% endblock %}

{% block fetch %}
https://github.com/AcademySoftwareFoundation/openexr/archive/refs/tags/v{{self.version().strip()}}.tar.gz
06494da42eb91c47265ffbad02d0c73cf65d8ad7f24683b801f34d842c4ecb6d
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/imath
lib/openjph
lib/deflate
{% endblock %}

{% block cmake_flags %}
OPENEXR_INSTALL_EXAMPLES=OFF
{% endblock %}
