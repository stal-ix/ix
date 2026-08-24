{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
exiv2
{% endblock %}

{% block version %}
0.28.8
{% endblock %}

{% block fetch %}
https://github.com/Exiv2/exiv2/archive/refs/tags/v{{self.version().strip()}}.tar.gz
ea51b0609f58a9afa063b60daa1539948b62247721e154f4fff0ad3aec9f9756
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
