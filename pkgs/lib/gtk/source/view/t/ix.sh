{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gtksourceview/-/archive/5.8.0/gtksourceview-5.8.0.tar.bz2
sha:aa59eac1088786ffb8154a954f063def13bd9abacb3396ac3844b880625dae62
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
