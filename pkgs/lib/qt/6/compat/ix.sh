{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qt5compat/archive/refs/tags/v6.6.2.tar.gz
sha:0f9e9c078674f99c4b7d332ad4a31acc6e94e2ce318d4dd3c4ccf92813ef2dfd
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/qt/6/base
{% endblock %}
