{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qt5compat/archive/refs/tags/v6.6.1.tar.gz
sha:591f1ca5d514a896f113e23d2edd8c051808e9ad6815ec15fb3abb7d96ca39b2
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/qt/6/base
{% endblock %}
