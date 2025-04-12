{% extends '//die/c/autorehell.sh' %}

{% block version %}
0.5.4.24
{% endblock %}

{% block fetch %}
https://github.com/ib/xarchiver/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:ac5775309820196761a7fab4355251e0e74b7fa09156db279b3a440183f97bd7
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
