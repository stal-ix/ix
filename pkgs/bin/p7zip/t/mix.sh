{% extends '//mix/make.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/p7zip/p7zip/16.02/p7zip_16.02_src_all.tar.bz2
a0128d661cfe7cc8c121e73519c54fbf
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
