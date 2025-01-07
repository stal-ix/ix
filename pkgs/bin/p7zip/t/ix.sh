{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/p7zip-project/p7zip/archive/refs/tags/v17.06.tar.gz
sha:c35640020e8f044b425d9c18e1808ff9206dc7caf77c9720f57eb0849d714cd1
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
