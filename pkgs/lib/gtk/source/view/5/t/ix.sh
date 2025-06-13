{% extends '//die/c/gnome.sh' %}

{% block pkg_name %}
gtksourceview
{% endblock %}

{% block version %}
5.16.0
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gtksourceview/-/archive/{{self.version().strip()}}/gtksourceview-{{self.version().strip()}}.tar.bz2
e7399ca309bde4b5f04d7ce443b1ab0077dc7cc18b6dfd13ab49f5305b00203c
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/xml/2
lib/gtk/4
lib/pcre/2
lib/fribidi
{% endblock %}

{% block bld_tool %}
{{super()}}
bin/xml/lint
{% endblock %}
