{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
uriparser
{% endblock %}

{% block version %}
1.0.2
{% endblock %}

{% block fetch %}
https://github.com/uriparser/uriparser/archive/refs/tags/uriparser-{{self.version().strip()}}.tar.gz
2dadd117a27919db41b84dff1ec7e3347fae8e09cfbb868505f2ff44287b57bf
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
BUILD_SHARED_LIBS=OFF
URIPARSER_BUILD_TESTS=OFF
URIPARSER_BUILD_DOCS=OFF
{% endblock %}
