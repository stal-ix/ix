{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/vyivel/libsfdo/-/archive/v0.1.3/libsfdo-v0.1.3.tar.bz2
sha:3798657acd816e0e735703396b9c79d8dfcd4971bbc3dcad4292e1cfa468e084
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
