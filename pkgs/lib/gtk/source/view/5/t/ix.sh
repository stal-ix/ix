{% extends '//die/c/gnome.sh' %}

{% block pkg_name %}
gtksourceview
{% endblock %}

{% block version %}
5.22.0
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gtksourceview/-/archive/{{self.version().strip()}}/gtksourceview-{{self.version().strip()}}.tar.bz2
f10f79865234b7c277b419a9647e78f329371d5ec3f5010dd0befbe75f3f123e
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
