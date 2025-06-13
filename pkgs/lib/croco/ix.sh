{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libcroco
{% endblock %}

{% block version %}
0.6.13
{% endblock %}

{% block fetch %}
http://ftp.gnome.org/pub/gnome/sources/libcroco/0.6/libcroco-{{self.version().strip()}}.tar.xz
767ec234ae7aa684695b3a735548224888132e063f92db585759b422570621d4
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/xml/2
{% endblock %}

{% block bld_tool %}
bld/gtkdoc
{% endblock %}
