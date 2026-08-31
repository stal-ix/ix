{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
xarchiver
{% endblock %}

{% block version %}
0.5.4.27
{% endblock %}

{% block fetch %}
https://github.com/ib/xarchiver/archive/refs/tags/{{self.version().strip()}}.tar.gz
a52db2697f433621346dc4af59952728192878471e29f46b4b4221b7d5623a86
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
