{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libspelling/-/archive/0.4.3/libspelling-0.4.3.tar.bz2
sha:7ae594242b537513ffe333530dad752eeeffb9e52872468d73ceccbda58932b9
{% endblock %}

{% block lib_deps %}
lib/c
lib/icu
lib/glib
lib/gtk/4
lib/pango
lib/enchant
lib/gtk/source/view/5
{% endblock %}

{% block meson_flags %}
introspection=disabled
sysprof=false
vapi=false
docs=false
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
