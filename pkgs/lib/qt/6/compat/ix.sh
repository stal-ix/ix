{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qt5compat/archive/refs/tags/v6.4.1.tar.gz
sha:67be0385b27441e4e98e8cc0658c63fee80a7cb52690688f2169c5bc834f3eb3
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/qt/6/base
{% endblock %}
