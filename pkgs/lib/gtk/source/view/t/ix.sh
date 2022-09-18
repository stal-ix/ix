{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gtksourceview/-/archive/5.6.0/gtksourceview-5.6.0.tar.bz2
sha:498b8e020341f4bc5fe11c917be0932b2e6569a169760643e3dd0c908a545d5f
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
bin/xmllint
{% endblock %}
