{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gtksourceview/-/archive/5.10.0/gtksourceview-5.10.0.tar.bz2
sha:e6645b9ae67e704bdb26ed61f7a979b38bef493fe25d77a815c2b093a171302b
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
