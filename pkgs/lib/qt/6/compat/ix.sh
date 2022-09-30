{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qt5compat/archive/refs/tags/v6.4.0.tar.gz
sha:d092afcb3406f176160da966e9b56465f3277a56f228ac7d2b3ea74bc9f1038c
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/qt/6/base
{% endblock %}
