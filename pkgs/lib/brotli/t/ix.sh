{% extends '//die/c/cmake.sh' %}

{% block version %}
1.1.0
{% endblock %}

{% block fetch %}
https://github.com/google/brotli/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:e720a6ca29428b803f4ad165371771f5398faba397edf6778837a18599ea13ff
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
BROTLI_SHARED_LIBS=
BROTLI_DISABLE_TESTS=ON
{% endblock %}
