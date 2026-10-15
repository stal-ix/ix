{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libadwaita
{% endblock %}

{% block version %}
1.10.0
{% endblock %}

{% block fetch %}
https://github.com/GNOME/libadwaita/archive/refs/tags/{{self.version().strip()}}.tar.gz
bd517433a327c216e5f4598c3e0e5e7ec2a4300c0ab7efca6481a44e7768a8e1
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/gtk/4
lib/fribidi
lib/ministream
{% endblock %}

{% block bld_tool %}
bld/glib
bin/sassc
{% endblock %}
