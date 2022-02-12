{% extends '//mix/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/atkmm/2.28/atkmm-2.28.2.tar.xz
sha:a0bb49765ceccc293ab2c6735ba100431807d384ffa14c2ebd30e07993fd2fa4
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/atk
lib/glib/mm
{% endblock %}
