{% extends '//mix/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gtksourceview/-/archive/5.4.0/gtksourceview-5.4.0.tar.bz2
sha:b6ef1b9fbffca866f85358c169bbbda84ccc261c049ad166064ee57142b3b4d3
{% endblock %}

{% block lib_deps %}
lib/c
lib/xml2
lib/glib
lib/gtk/4
lib/pcre/2
lib/fribidi
{% endblock %}

{% block bld_tool %}
bin/glib/codegen
bld/scripts/gnome
{% endblock %}
