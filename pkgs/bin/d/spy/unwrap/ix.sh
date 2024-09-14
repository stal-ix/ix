{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/d-spy/-/archive/47.0/d-spy-47.0.tar.bz2
sha:6dae353c0f515a898352f38429ca5376d8c5b47f258d2abda25df3248d435033
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
