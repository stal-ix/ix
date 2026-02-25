{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libspelling
{% endblock %}

{% block version %}
0.4.10
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libspelling/-/archive/{{self.version().strip()}}/libspelling-{{self.version().strip()}}.tar.bz2
d6388f3dc207269743ec920b14bb3be55ab4bd97a18e167b52a09cec0554dc2b
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
