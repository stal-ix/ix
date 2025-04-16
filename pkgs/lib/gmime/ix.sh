{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
gmime
{% endblock %}

{% block version %}
3.2.15
{% endblock %}

{% block fetch %}
https://github.com/jstedfast/gmime/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:06662db189ce56782c23c7c4adfebfa512350c2fa9514f0d551df42c7f940076
{% endblock %}

{% block conf_ver %}2/71{% endblock %}

{% block lib_deps %}
lib/c
lib/z
lib/glib
lib/idn/2
{% endblock %}

{% block bld_tool %}
bld/gtkdoc
{% endblock %}

{% block configure_flags %}
--disable-gtk-doc
--enable-introspection=no
--enable-vala=no
{% endblock %}
