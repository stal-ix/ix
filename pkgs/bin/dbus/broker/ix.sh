{% extends '//die/c/meson.sh' %}

{% block version %}
37
{% endblock %}

{% block pkg_name %}
dbus-broker
{% endblock %}

{% block fetch %}
https://github.com/bus1/dbus-broker/archive/refs/tags/v{{self.version().strip()}}.tar.gz
c842f844cd052ef1ffacb11da41812c5801c6d1e32450ce26410f1a5143d71bc
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
