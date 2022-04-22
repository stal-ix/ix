{% extends '//mix/gnome.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/gtksourceview/-/archive/5.4.1/gtksourceview-5.4.1.tar.bz2
sha:3b27531a56c54b7cd72a9131317fdb822fac847e34f3985d7658c47693e26d7b
{% endblock %}

{% block lib_deps %}
lib/c
lib/xml2
lib/glib
lib/gtk/4
lib/pcre/2
lib/fribidi
{% endblock %}
