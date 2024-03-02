{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/ib/xarchiver/archive/refs/tags/0.5.4.23.tar.gz
sha:319935cd323e865d8aa12023b5286c314c128491ac58e853e63f6d6ea3da2a27
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
lib/gtk/3
{% endblock %}

{% block bld_tool %}
bld/gettext
bld/intltool
{% endblock %}

{% block configure_flags %}
--disable-doc
{% endblock %}

{% block c_rename_symbol %}
_caches
{% endblock %}
