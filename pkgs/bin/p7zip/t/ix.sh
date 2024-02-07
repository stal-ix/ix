{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/p7zip-project/p7zip/archive/refs/tags/v17.05.tar.gz
sha:d2788f892571058c08d27095c22154579dfefb807ebe357d145ab2ddddefb1a6
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block bld_tool %}
bld/gzip
{% endblock %}

{% block setup_target_flags %}
export CXXFLAGS="-std=c++03 ${CXXFLAGS}"
{% endblock %}

{% block cpp_defines %}
DONT_REDEFINE_NEW=1
{% endblock %}

{% block make_flags %}
-f makefile
CC=clang
CXX=clang++
{% endblock %}
