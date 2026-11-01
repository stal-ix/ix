{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
brotli
{% endblock %}

{% block version %}
1.2.1
{% endblock %}

{% block fetch %}
https://github.com/google/brotli/archive/refs/tags/v{{self.version().strip()}}.tar.gz
98d35d11a78dc453aebb7d10c3748f3f73ff78c8267c0dc697b8631f67bf7e8f
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
BROTLI_SHARED_LIBS=
BROTLI_DISABLE_TESTS=ON
{% endblock %}
