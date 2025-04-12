{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libhandy
{% endblock %}

{% block version %}
1.8.2
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libhandy/-/archive/{{self.version().strip()}}/libhandy-{{self.version().strip()}}.tar.bz2
sha:67bea0c4afa56f0512a9d872ffc6b8335236f38164b245d1baf85dccde26c05c
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/gtk/3
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}

{% block meson_flags %}
glade_catalog=disabled
{% endblock %}
