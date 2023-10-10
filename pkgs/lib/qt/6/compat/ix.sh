{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qt5compat/archive/refs/tags/v6.6.0.tar.gz
sha:5ee8437622688c2c6d0041ab62626b740e915d0cd7a26c7bd1b5682f3c90d38a
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/qt/6/base
{% endblock %}
