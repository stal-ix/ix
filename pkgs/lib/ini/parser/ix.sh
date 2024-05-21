{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ndevilla/iniparser/archive/refs/tags/v4.2.2.tar.gz
sha:82983d9712e321494ee67e1d90963545b6788c198611dab094804a7b7414b233
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
BUILD_EXAMPLES=OFF
BUILD_DOCS=OFF
{% endblock %}
