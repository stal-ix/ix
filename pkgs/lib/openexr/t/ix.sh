{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
openexr
{% endblock %}

{% block version %}
3.5.3
{% endblock %}

{% block fetch %}
https://github.com/AcademySoftwareFoundation/openexr/archive/refs/tags/v{{self.version().strip()}}.tar.gz
ff1de95f4031c1c57c633e647dc97c15282d3aa3bc7fb90745f00f74de4a054f
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/imath
lib/openjph
lib/deflate
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block cmake_flags %}
OPENEXR_INSTALL_EXAMPLES=OFF
{% endblock %}
