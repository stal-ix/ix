{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
uriparser
{% endblock %}

{% block version %}
0.9.9
{% endblock %}

{% block fetch %}
https://github.com/uriparser/uriparser/archive/refs/tags/uriparser-{{self.version().strip()}}.tar.gz
128554f11013af67f727a6bde8bfbff037df9bd20ca201d5ffe0cea786c43ff4
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
BUILD_SHARED_LIBS=OFF
URIPARSER_BUILD_TESTS=OFF
URIPARSER_BUILD_DOCS=OFF
{% endblock %}
