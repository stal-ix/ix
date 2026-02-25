{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
jansson
{% endblock %}

{% block version %}
2.15.0
{% endblock %}

{% block fetch %}
https://github.com/akheron/jansson/archive/refs/tags/v{{self.version().strip()}}.tar.gz
73ac12bbc62ff536e40c7a3e15ed007993c5ca4d23897de23f1906f891b5a4bb
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
