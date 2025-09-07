{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
exiv2
{% endblock %}

{% block version %}
0.28.7
{% endblock %}

{% block fetch %}
https://github.com/Exiv2/exiv2/archive/refs/tags/v{{self.version().strip()}}.tar.gz
5e292b02614dbc0cee40fe1116db2f42f63ef6b2ba430c77b614e17b8d61a638
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/expat
lib/brotli
{% endblock %}

{% block cmake_flags %}
EXIV2_ENABLE_INIH=OFF
EXIV2_ENABLE_BMFF=ON
EXIV2_BUILD_SAMPLES=OFF
EXIV2_ENABLE_DYNAMIC_RUNTIME=OFF
EXIV2_TEAM_WARNINGS_AS_ERRORS=OFF
{% endblock %}
