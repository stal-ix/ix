{% extends '//die/c/gnome.sh' %}

{% block pkg_name %}
gtksourceview
{% endblock %}

{% block version %}
5.18.0
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gtksourceview/-/archive/{{self.version().strip()}}/gtksourceview-{{self.version().strip()}}.tar.bz2
9ed5422b5baf9e78964eb962cbe437549bc719d98432a27913afc92aa233548f
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
