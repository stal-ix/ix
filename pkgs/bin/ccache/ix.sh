{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ccache/ccache/archive/refs/tags/v4.11.1.tar.gz
sha:b38eb8b239296829a07cfb7a1aeeb31660d2f25eaa6c1cf1ede4b4370708e589
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
