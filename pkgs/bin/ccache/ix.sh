{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
ccache
{% endblock %}

{% block version %}
4.14.3
{% endblock %}

{% block fetch %}
https://github.com/ccache/ccache/archive/refs/tags/v{{self.version().strip()}}.tar.gz
f769f9e3ad7fc9e8faf68bcc4f63ba52f246df49bb378924b2529d6f05b76161
{% endblock %}

{% block bld_libs %}
lib/c
lib/fmt
lib/zstd
lib/xxhash
lib/hiredis
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block cmake_flags %}
ENABLE_DOCUMENTATION=OFF
ENABLE_TESTING=OFF
{% endblock %}
