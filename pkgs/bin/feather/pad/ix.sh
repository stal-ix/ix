{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
FeatherPad
{% endblock %}

{% block version %}
1.6.3
{% endblock %}

{% block fetch %}
https://github.com/tsujan/FeatherPad/archive/refs/tags/V{{self.version().strip()}}.tar.gz
e1eab693d8806855dce0f8a2078aed8a05fb9c1825ad3308468cd9fc797f3e09
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
