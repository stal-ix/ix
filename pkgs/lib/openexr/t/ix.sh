{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
openexr
{% endblock %}

{% block version %}
3.5.1
{% endblock %}

{% block fetch %}
https://github.com/AcademySoftwareFoundation/openexr/archive/refs/tags/v{{self.version().strip()}}.tar.gz
61559d6d0657f228f8dd5e3165ed6b74437b95e81849ad41c6d3493c0c144c1d
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
