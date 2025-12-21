{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libportal
{% endblock %}

{% block version %}
0.9.1
{% endblock %}

{% block fetch %}
https://github.com/flatpak/libportal/archive/refs/tags/{{self.version().strip()}}.tar.gz
ea422b789ae487e04194d387bea031fd7485bf88a18aef8c767f7d1c29496a4e
{% endblock %}

{% block lib_deps %}
lib/c
lib/gtk/{{gtk_ver}}
{% endblock %}

{% block bld_tool %}
bld/gnome
{% endblock %}

{% block meson_flags %}
docs=false
tests=false
backend-gtk{{gtk_ver}}=enabled
{% endblock %}
