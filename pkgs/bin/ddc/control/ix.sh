{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/ddccontrol/ddccontrol/archive/refs/tags/1.0.3.tar.gz
sha:4f3a3d9a00e09b07423d2aed308b21dccfe57642f5d9bbf79802a0656dd11d1e
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
lib/xml/2
lib/kernel
lib/pci/utils
{% endblock %}

{% block bld_tool %}
bld/glib
bld/gettext
bld/fake(tool_name=intltoolize)
{% endblock %}

{% block configure_flags %}
--disable-nls
--disable-gnome
{% endblock %}
