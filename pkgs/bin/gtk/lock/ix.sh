{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
gtklock
{% endblock %}

{% block version %}
5.0.0
{% endblock %}

{% block fetch %}
https://github.com/jovanlanik/gtklock/archive/refs/tags/v{{self.version().strip()}}.tar.gz
018c50cf1d7b626f823e797750e5b304511b3b359e7277e8abb3383c11e7aed9
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk/3
lib/wayland
lib/pam/unix
lib/gtk/session/lock
lib/gtk/layer/shell/3
{% endblock %}

{% block bld_tool %}
bld/glib
bin/scdoc
bld/wayland
bin/xml/lint
bld/pkg/config
{% endblock %}

{% block c_flags %}
-Wno-implicit-function-declaration
{% endblock %}
