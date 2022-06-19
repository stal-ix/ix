{% extends '//die/make.sh' %}

{% block fetch %}
#https://downloads.sourceforge.net/project/p7zip/p7zip/16.02/p7zip_16.02_src_all.tar.bz2
#a0128d661cfe7cc8c121e73519c54fbf
https://github.com/jinfeihan57/p7zip/archive/refs/tags/v17.04.tar.gz
sha:ea029a2e21d2d6ad0a156f6679bd66836204aa78148a4c5e498fe682e77127ef
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block setup %}
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
