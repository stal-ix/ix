{% extends '//lib/gtk/4/4/mix.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gtk/-/archive/4.6.0/gtk-4.6.0.tar.bz2
111bb032239203913f40d43eb7f661f9
{% endblock %}

{% block bld_tool %}
lib/sass/c
{{super()}}
{% endblock %}
