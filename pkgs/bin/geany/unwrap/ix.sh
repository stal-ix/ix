{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/geany/geany/archive/refs/tags/1.38.0.tar.gz
sha:d3b23a61f6ec3893671bac4f988f6ec3856092a233a47e3a170dc64212827e92
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk/3
lib/gdk/pixbuf/svg
{% endblock %}

{% block bld_tool %}
bld/glib
bld/gettext
bld/intltool
{% endblock %}

{% block configure_flags %}
--disable-html-docs
{% endblock %}
