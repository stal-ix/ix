{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libportal
{% endblock %}

{% block version %}
0.11.0
{% endblock %}

{% block fetch %}
https://github.com/flatpak/libportal/archive/refs/tags/{{self.version().strip()}}.tar.gz
71482afa68b3373268e7df7feaf96ce99eb1a6701f60ff43a0d1b2594605eae8
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
