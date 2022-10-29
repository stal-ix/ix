{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ccache/ccache/releases/download/v4.7.2/ccache-4.7.2.tar.xz
sha:17ca75a577d49c1e4f2ac86d53126859de52b789cfe85dd532758518db114eaf
{% endblock %}

{% block bld_libs %}
lib/c
lib/zstd
lib/hiredis
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block cmake_flags %}
ENABLE_DOCUMENTATION=OFF
ENABLE_TESTING=OFF
{% endblock %}
