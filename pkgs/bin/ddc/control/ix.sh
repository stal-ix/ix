{% extends '//die/c/autorehell.sh' %}

# noauto: from 3.1 the core is Rust

{% block pkg_name %}
ddccontrol
{% endblock %}

{% block version %}
3.0.0
{% endblock %}

{% block fetch %}
https://github.com/ddccontrol/ddccontrol/archive/refs/tags/{{self.version().strip()}}.tar.gz
15a40781faefc2505346d686c931d10cd6a972b001e9998c5b8368f148f0bebf
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
