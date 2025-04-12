{% extends '//die/c/cmake.sh' %}

{% block version %}
3.3.3
{% endblock %}

{% block fetch %}
https://github.com/AcademySoftwareFoundation/openexr/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:0ffbd842a7ee2128d44affdea30f42294b4061293cde3aa75b61a53573413d1e
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
