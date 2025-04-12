{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
iwgtk
{% endblock %}

{% block version %}
0.9
{% endblock %}

{% block fetch %}
https://github.com/J-Lentz/iwgtk/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:84a82dc730fe536034a65d148840e975c1353f4114db527439170ff410583d31
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk
lib/glib
lib/qrencode
lib/gdk/pixbuf/svg
{% endblock %}

{% block bld_tool %}
bin/gzip
bin/scdoc
bld/pkg/config
{% endblock %}
