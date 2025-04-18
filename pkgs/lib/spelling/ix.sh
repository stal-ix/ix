{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libspelling
{% endblock %}

{% block version %}
0.4.8
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libspelling/-/archive/{{self.version().strip()}}/libspelling-{{self.version().strip()}}.tar.bz2
sha:dadd7bfc58511b85f966570b6f241ae1c695986746daa634de4a2d856886ae18
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
