{% extends '//lib/gtk/4/4/ix.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gtk/-/archive/4.6.4/gtk-4.6.4.tar.bz2
sha:43ea7d10ebcd415edeb6934057b4cd7f09addb30d0fea1ed99f33793a12b330a
{% endblock %}

{% block bld_tool %}
bin/sassc
{{super()}}
{% endblock %}
