{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
FeatherPad
{% endblock %}

{% block version %}
1.6.4
{% endblock %}

{% block fetch %}
https://github.com/tsujan/FeatherPad/archive/refs/tags/V{{self.version().strip()}}.tar.gz
1442f14aefdb0de26822562d69c446b0e2b4e607597925a2e0c2c7b063e1654e
{% endblock %}

{% block bld_libs %}
lib/c
lib/hunspell
lib/qt/6/base
lib/qt/6/deps
{% endblock %}

{% block bld_tool %}
bld/qt/6
bld/qt/6/tools
{% endblock %}

{% block cmake_flags %}
ENABLE_QT5=OFF
WITHOUT_X11=ON
{% endblock %}
