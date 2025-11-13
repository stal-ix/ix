{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
brotli
{% endblock %}

{% block version %}
1.2.0
{% endblock %}

{% block fetch %}
https://github.com/google/brotli/archive/refs/tags/v{{self.version().strip()}}.tar.gz
816c96e8e8f193b40151dad7e8ff37b1221d019dbcb9c35cd3fadbfe6477dfec
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
BROTLI_SHARED_LIBS=
BROTLI_DISABLE_TESTS=ON
{% endblock %}
