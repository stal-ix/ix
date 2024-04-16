{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/luceneplusplus/LucenePlusPlus
{% endblock %}

{% block git_commit %}
76dc90f2b65d81be018c499714ff11e121ba5585
{% endblock %}

{% block git_sha %}
4a881d9fa25c46436bca26f701cde333ed52f7bcdc63a88be6b70e5593cef0e2
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
