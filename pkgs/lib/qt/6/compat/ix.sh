{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qt5compat/archive/refs/tags/v6.5.0.tar.gz
sha:6845f915693ac42e9fe6e6a5b12e4535db3b1cd63dd6c48dad223b2e9a5ac441
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/qt/6/base
{% endblock %}
