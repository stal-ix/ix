{% extends '//lib/gtk/4/4/mix.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gtk/-/archive/4.6.2/gtk-4.6.2.tar.bz2
sha:
{% endblock %}

{% block bld_tool %}
lib/sass/c
{{super()}}
{% endblock %}
