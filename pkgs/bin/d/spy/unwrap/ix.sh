{% extends '//die/c/gnome.sh' %}

{% block pkg_name %}
d-spy
{% endblock %}

{% block version %}
50.0
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/d-spy/-/archive/{{self.version().strip()}}/d-spy-{{self.version().strip()}}.tar.bz2
eaab4c62ee48f83c1779f9e55a47285e0599020e58a0361c615e27513171219e
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk
lib/dex
lib/glib
lib/adwaita
lib/ucontext
{% endblock %}
