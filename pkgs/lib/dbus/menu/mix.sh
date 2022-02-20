{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://launchpad.net/libdbusmenu/16.04/16.04.0/+download/libdbusmenu-16.04.0.tar.gz
sha:b9cc4a2acd74509435892823607d966d424bd9ad5d0b00938f27240a1bfa878a
{% endblock %}

{% block lib_deps %}
lib/c
lib/atk
lib/glib
lib/dbus
lib/gtk/3
{% endblock %}

{% block bld_tool %}
bld/python
bin/gettext
lib/intl/tool
bin/glib/codegen
{% endblock %}

{% block configure_flags %}
--with-gtk=3
--disable-vala
--disable-dumper
--enable-dumper=no
{% endblock %}

{% block strip_pc %}
echo 'TODO(pg): check it'
{% endblock %}
