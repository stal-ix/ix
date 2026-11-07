{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libspelling
{% endblock %}

{% block version %}
0.4.11
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libspelling/-/archive/{{self.version().strip()}}/libspelling-{{self.version().strip()}}.tar.bz2
304ff82faaeb0ba131765a819f2db8ba5655bdbadc78fea64c12033274acebec
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
