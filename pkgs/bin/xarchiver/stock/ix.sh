{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
xarchiver
{% endblock %}

{% block version %}
0.5.4.25
{% endblock %}

{% block fetch %}
https://github.com/ib/xarchiver/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:dfd70c9081790399c32d9d716a55060e5136ff0ad1a94a84988a55fd6f771ceb
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
