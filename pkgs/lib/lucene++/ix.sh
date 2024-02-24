{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/luceneplusplus/LucenePlusPlus/archive/refs/tags/rel_3.0.9.tar.gz
sha:4e69e29d5d79a976498ef71eab70c9c88c7014708be4450a9fda7780fe93584e
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
sed -e 's|.*exec_prefix.*||' -i ${out}/lib/pkgconfig/liblucene++.pc
sed -e 's|.*exec_prefix.*||' -i ${out}/lib/pkgconfig/liblucene++-contrib.pc
{% endblock %}
