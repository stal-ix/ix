{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
uriparser
{% endblock %}

{% block version %}
0.9.8
{% endblock %}

{% block fetch %}
https://github.com/uriparser/uriparser/archive/refs/tags/uriparser-{{self.version().strip()}}.tar.gz
sha:d6289387eaf2495e38ed80d709ad673fe04d63fad707badfee96f3d2dabc7c35
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
BUILD_SHARED_LIBS=OFF
URIPARSER_BUILD_TESTS=OFF
URIPARSER_BUILD_DOCS=OFF
{% endblock %}
