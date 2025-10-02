{% extends '//die/c/gnome.sh' %}

{% block pkg_name %}
d-spy
{% endblock %}

{% block version %}
49.1
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/d-spy/-/archive/{{self.version().strip()}}/d-spy-{{self.version().strip()}}.tar.bz2
d014d28979576926cbc522f89f75325cb4298b5f8d1ff92d12dbc631923011ba
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk
lib/dex
lib/glib
lib/adwaita
lib/ucontext
{% endblock %}
