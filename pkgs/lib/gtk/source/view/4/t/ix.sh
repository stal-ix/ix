{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gtksourceview/-/archive/4.8.4/gtksourceview-4.8.4.tar.bz2
sha:890c3761343d986625a5297a648c3ac7e34703580dd2d927706f6c6bd0f231fc
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/xml/2
lib/gtk/3
lib/pcre/2
lib/fribidi
{% endblock %}

{% block bld_tool %}
{{super()}}
bin/xml/lint
{% endblock %}
