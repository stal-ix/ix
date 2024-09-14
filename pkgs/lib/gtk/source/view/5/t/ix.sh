{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gtksourceview/-/archive/5.14.0/gtksourceview-5.14.0.tar.bz2
sha:59d70a6601b8c3c31d594a18838c29086a78e473a1a709e1188ab5f9eb8c5841
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
