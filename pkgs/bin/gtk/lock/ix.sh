{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/jovanlanik/gtklock/archive/refs/tags/v2.0.1.tar.gz
sha:d1802a7fcb8cace0408ab34627841d7ea28d630f934c8b7884536f9dfa76910e
{% endblock %}

{% block bld_libs %}
lib/c
lib/gtk/3
lib/wayland
lib/pam/unix
lib/gtk/layer/shell
{% endblock %}

{% block bld_tool %}
bin/scdoc
bld/wayland
bin/xmllint
bld/pkg/config
bld/glib
{% endblock %}
