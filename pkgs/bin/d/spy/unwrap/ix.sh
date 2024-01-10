{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/d-spy/-/archive/1.9.0/d-spy-1.9.0.tar.bz2
sha:4d7ee7d19cca1947127cbc660eee7799ef18244eb8c407dd9c8bf52d77a394e3
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk
lib/glib
lib/adwaita
{% endblock %}

{% block bld_tool %}
{{super()}}
bld/gettext
{% endblock %}
