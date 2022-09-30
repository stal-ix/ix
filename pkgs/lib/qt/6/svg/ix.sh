{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtsvg/archive/refs/tags/v6.4.0.tar.gz
sha:375eb69f320121e42d5dc107f9455008980c149646931b8ace19e6bc235dcd80
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/qt/6/base
{% endblock %}
