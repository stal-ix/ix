{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/uriparser/uriparser/archive/refs/tags/uriparser-0.9.6.tar.gz
sha:defaf550bf6fe05e89afb9814dccc6bd643a3b0a8308801a2c04b76682b87383
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
BUILD_SHARED_LIBS=OFF
URIPARSER_BUILD_TESTS=OFF
URIPARSER_BUILD_DOCS=OFF
{% endblock %}
