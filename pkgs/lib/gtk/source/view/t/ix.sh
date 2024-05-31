{% extends '//die/c/gnome.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gtksourceview/-/archive/5.12.1/gtksourceview-5.12.1.tar.bz2
sha:08ec3976f3a2f1615a307803819be96f05624b2d654628f551f6bcc51af16837
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
