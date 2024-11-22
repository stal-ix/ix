{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gtksourceview/-/archive/5.14.2/gtksourceview-5.14.2.tar.bz2
sha:ed95c15fd1cb4c017883b154f412a19fe6db248c869a94da91ee08d6877aef25
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
