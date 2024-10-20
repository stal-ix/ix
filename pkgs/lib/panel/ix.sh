{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libpanel/-/archive/1.8.1/libpanel-1.8.1.tar.bz2
sha:541c7326395f5031b0a259434288f3afda8f61d71f8e68c3eb5441379e2c1756
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk
lib/glib
lib/adwaita
{% endblock %}

{% block meson_flags %}
docs=disabled
introspection=disabled
{% endblock %}

{% block bld_tool %}
bld/glib
bld/gnome
bld/gettext
{% endblock %}
