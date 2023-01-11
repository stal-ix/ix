{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gtksourceview/-/archive/5.6.2/gtksourceview-5.6.2.tar.bz2
sha:3c58d2ff7650e46bce1ed2975f33c1a22ebf5651b364f372a7b940c9321d3930
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
