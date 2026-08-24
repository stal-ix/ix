{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
ddccontrol
{% endblock %}

{% block version %}
3.2.0
{% endblock %}

{% block fetch %}
https://github.com/ddccontrol/ddccontrol/archive/refs/tags/{{self.version().strip()}}.tar.gz
2565aa907cc891554bf01878444326a97cd53a7b91dc7207b1dbddc87bca1331
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
