{% extends '//die/c/cmake.sh' %}

{% block pkg_name %}
FeatherPad
{% endblock %}

{% block version %}
1.6.1
{% endblock %}

{% block fetch %}
https://github.com/tsujan/FeatherPad/archive/refs/tags/V{{self.version().strip()}}.tar.gz
sha:38f4168d0853e3336744f9b091b91ffac11c5a3237a6db8de081bc5e9037442e
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
