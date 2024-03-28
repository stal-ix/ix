{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qt5compat/archive/refs/tags/v6.6.3.tar.gz
sha:0dc4efc5a009418e478fff0a0c31bdb6837ed9dfb357156277af8e7cc734a909
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/qt/6/base
{% endblock %}
