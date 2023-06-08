{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qt5compat/archive/refs/tags/v6.5.1.tar.gz
sha:0da456cc9f77eea1c458702afcd898ef2e269e31ad5a295f514413f1dc3dd253
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/qt/6/base
{% endblock %}
