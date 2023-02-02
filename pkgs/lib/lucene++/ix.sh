{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/luceneplusplus/LucenePlusPlus/archive/refs/tags/rel_3.0.8.tar.gz
sha:af5cf59a93cf6dce86828e108e010359517c25ce487152af68520785d183813c
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/c++
lib/boost
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block cmake_flags %}
ENABLE_DEMO=OFF
ENABLE_TEST=OFF
LUCENE_BUILD_SHARED=OFF
{% endblock %}

{% block cpp_missing %}
stdlib.h
string.h
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv include/pkgconfig lib/
mv include/cmake lib/
sed -e 's|.*exec_prefix.*||' -i lib/pkgconfig/liblucene++.pc
sed -e 's|.*exec_prefix.*||' -i lib/pkgconfig/liblucene++-contrib.pc
{% endblock %}
