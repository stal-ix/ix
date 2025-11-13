{% extends '//die/c/gnome.sh' %}

{% block pkg_name %}
d-spy
{% endblock %}

{% block version %}
49.2
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/d-spy/-/archive/{{self.version().strip()}}/d-spy-{{self.version().strip()}}.tar.bz2
ddff71ff69bc5f5751fd596d75a89cf84932a5f220d2f0ef52f176e92849c5ac
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk
lib/dex
lib/glib
lib/adwaita
lib/ucontext
{% endblock %}
