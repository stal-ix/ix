{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/emil-e/rapidcheck/archive/1505cbbce733bde3b78042cf2e9309c0b7f227a2.tar.gz
sem:f637700386b3f63de6c9b246200cf7d339a51269e541e5238532bbec01ca1a2b
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/googletest
{% endblock %}

{% block cmake_flags %}
RC_ENABLE_GTEST=ON
{% endblock %}
