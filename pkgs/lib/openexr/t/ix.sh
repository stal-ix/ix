{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
openexr
{% endblock %}

{% block version %}
3.4.15
{% endblock %}

{% block fetch %}
https://github.com/AcademySoftwareFoundation/openexr/archive/refs/tags/v{{self.version().strip()}}.tar.gz
445ed5b0ea4d9cf98be3a4f219e419628b123b61dec65ccb743ab9b07fbebdaa
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
