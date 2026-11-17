{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
gtklock
{% endblock %}

{% block version %}
5.0.1
{% endblock %}

{% block fetch %}
https://github.com/jovanlanik/gtklock/archive/refs/tags/v{{self.version().strip()}}.tar.gz
b51bce5d81643dc3dcb422554d28e919f95d418ef54a082509763dfb6fdfb145
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
