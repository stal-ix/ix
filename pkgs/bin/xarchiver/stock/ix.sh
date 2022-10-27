{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/ib/xarchiver/archive/refs/tags/0.5.4.20.tar.gz
sha:929e8609d769ab97a18494ef75bef443e244a62b045f637078fe5df87bbcf9ff
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
