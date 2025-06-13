{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
FeatherPad
{% endblock %}

{% block version %}
1.6.2
{% endblock %}

{% block fetch %}
https://github.com/tsujan/FeatherPad/archive/refs/tags/V{{self.version().strip()}}.tar.gz
9753796b2a525a4d6b13696681e9fbb094edcc20e8aadffcd5bb6fe22d0a5fdb
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
