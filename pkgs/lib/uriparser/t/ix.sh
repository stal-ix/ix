{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
uriparser
{% endblock %}

{% block version %}
1.0.3
{% endblock %}

{% block fetch %}
https://github.com/uriparser/uriparser/archive/refs/tags/uriparser-{{self.version().strip()}}.tar.gz
cceea60fa86109cdde5c06ef878f38c18394cd189abf4a4dbaf1d59cfaf8a03d
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
BUILD_SHARED_LIBS=OFF
URIPARSER_BUILD_TESTS=OFF
URIPARSER_BUILD_DOCS=OFF
{% endblock %}
