{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
jansson
{% endblock %}

{% block version %}
2.14.1
{% endblock %}

{% block fetch %}
https://github.com/akheron/jansson/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:979210eaffdffbcf54cfc34d047fccde13f21b529a381df26db871d886f729a4
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
