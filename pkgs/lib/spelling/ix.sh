{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libspelling
{% endblock %}

{% block version %}
0.4.9
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libspelling/-/archive/{{self.version().strip()}}/libspelling-{{self.version().strip()}}.tar.bz2
e0f1785e3314bd081bd3da391547af741d4b313c655d5cf512e4ef1aee615997
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
