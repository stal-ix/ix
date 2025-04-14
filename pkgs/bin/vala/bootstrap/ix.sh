{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
vala
{% endblock %}

{% block version %}
0.48.25
{% endblock %}

{% block fetch %}
https://download.gnome.org/sources/vala/0.48/vala-{{self.version().strip()}}.tar.xz
sha:50cb3c5eccddc7fd4368bfa96414a556045e79d2b15a68918c727b8c83b18a24
{% endblock %}

{% block bld_libs %}
lib/c
lib/glib
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
{% endblock %}

{% block configure_flags %}
--disable-valadoc
{% endblock %}
