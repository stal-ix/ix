{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/google/highway/archive/refs/tags/0.15.0.tar.gz
sha:4bbd4439eae08cf038f1c5cc5d9ebc6a1a50f2c610c13a1483adccacfa24c150
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block bld_libs %}
lib/googletest
{% endblock %}

{% block cmake_flags %}
HWY_ENABLE_EXAMPLES=OFF
BUILD_TESTING=OFF
{% endblock %}
