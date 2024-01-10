{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/bus1/dbus-broker/archive/refs/tags/v35.tar.gz
sha:083cee7818965aac233e73346d36dc6f7cca8cf16f41c94274a089a0fe6c0b25
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
