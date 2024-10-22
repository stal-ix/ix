{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/jovanlanik/gtklock/archive/refs/tags/v4.0.0.tar.gz
sha:db20bf27bd5dd01901ea1753c89c170777dd7cf8fca19130cf90f5f4e3fb9633
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk/3
lib/wayland
lib/pam/unix
lib/gtk/layer/shell
lib/gtk/session/lock
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
