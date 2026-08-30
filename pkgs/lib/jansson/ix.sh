{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
jansson
{% endblock %}

{% block version %}
2.15.1
{% endblock %}

{% block fetch %}
https://github.com/akheron/jansson/archive/refs/tags/v{{self.version().strip()}}.tar.gz
dbf95cb0af903f4fb8b61507d96b45b67db7d1479688ede352e1d571394d06f7
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
USE_WINDOWS_CRYPTOAPI=OFF
JANSSON_EXAMPLES=OFF
JANSSON_BUILD_DOCS=OFF
JANSSON_WITHOUT_TESTS=ON
{% endblock %}
