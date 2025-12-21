{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libpanel
{% endblock %}

{% block version %}
1.10.3
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libpanel/-/archive/{{self.version().strip()}}/libpanel-{{self.version().strip()}}.tar.bz2
4445c8367e97a82b37e943db71ddd3f0204c073c423b94f980c95ca1bfa5d789
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
bld/gnome
{% endblock %}
