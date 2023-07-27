{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/doxygen/doxygen/archive/refs/tags/Release_1_9_7.tar.gz
sha:691777992a7240ed1f822a5c2ff2c4273b57c1cf9fc143553d87f91a0c5970ee
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/iconv
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
bld/python
{% endblock %}

{% block cmake_flags %}
ICONV_COMPILES=TRUE
ICONV_INCLUDE_DIR=/nowhere
ICONV_ACCEPTS_CONST_INPUT=TRUE
ICONV_ACCEPTS_NONCONST_INPUT=FALSE
ICONV_IN_GLIBC=FALSE
{% endblock %}
