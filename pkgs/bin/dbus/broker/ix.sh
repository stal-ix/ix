{% extends '//die/c/meson.sh' %}

{% block version %}
36
{% endblock %}

{% block pkg_name %}
dbus-broker
{% endblock %}

{% block fetch %}
https://github.com/bus1/dbus-broker/archive/refs/tags/v{{self.version().strip()}}.tar.gz
5058a81eea8086636ef09a670d103e35e650a6f0200aadc2f59f3fb6e76c37b8
{% endblock %}

{% block lib_deps %}
lib/c
lib/kernel
lib/c/util/ini
lib/c/util/dvar
lib/c/util/utf8
lib/c/util/list
lib/c/util/rbtree
lib/c/util/stdaux
lib/c/util/shquote
{% endblock %}

{% block meson_flags %}
launcher=false
linux-4-17=true
{% endblock %}
