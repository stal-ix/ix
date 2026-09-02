{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
exiv2
{% endblock %}

{% block version %}
0.28.9
{% endblock %}

{% block fetch %}
https://github.com/Exiv2/exiv2/archive/refs/tags/v{{self.version().strip()}}.tar.gz
700b76b97695b2fab4ef8c79619c68ae57d09e0c130724791cafbd39e0eb4aef
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
