{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/d-spy/-/archive/1.10.0/d-spy-1.10.0.tar.bz2
sha:891e236084c548f902d6335967a061d9163a3ae5a3549d1fcdb733e4f9e69468
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
