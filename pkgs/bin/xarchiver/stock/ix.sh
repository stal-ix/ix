{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/ib/xarchiver/archive/refs/tags/0.5.4.19.tar.gz
sha:3a7b74699527da196034c089ebdc6d6b1360b717ad9811b782719a2194b4734f
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
