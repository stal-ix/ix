{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
xarchiver
{% endblock %}

{% block version %}
0.5.4.26
{% endblock %}

{% block fetch %}
https://github.com/ib/xarchiver/archive/refs/tags/{{self.version().strip()}}.tar.gz
58e4fb2c1fb8421573a31cf3b4dfec301076d61f48ac5720df632986c87e9573
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
