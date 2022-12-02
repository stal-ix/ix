{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/tsujan/FeatherPad/archive/refs/tags/V1.3.4.tar.gz
sha:b3fbc17e3a7b8bd0e0f408ebff1de32d0de0774762bffbcaa37d11c5eec1283d
{% endblock %}

{% block bld_libs %}
lib/c
lib/hunspell
lib/qt/6/base
lib/qt/6/deps
{% endblock %}

{% block cmake_flags %}
ENABLE_QT5=OFF
WITHOUT_X11=ON
{% endblock %}
