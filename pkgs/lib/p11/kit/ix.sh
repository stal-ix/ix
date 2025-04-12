{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
p11-kit
{% endblock %}

{% block version %}
0.25.4
{% endblock %}

{% block fetch %}
https://github.com/p11-glue/p11-kit/releases/download/{{self.version().strip()}}/p11-kit-{{self.version().strip()}}.tar.xz
sha:4c4153f81167444ff6d5e7ca118472ae607bd25c0cf6346fcc5dcc30451e97ce
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
{% endblock %}

{% block c_rename_symbol %}
getprogname
{% endblock %}

{% block meson_flags %}
test=false
{% endblock %}
