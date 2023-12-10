{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://git.pwmt.org/pwmt/girara/-/archive/0.4.1/girara-0.4.1.tar.bz2
sha:3e9120aeacb2b9504d6c9be468f5b1491ccfd45720bbf6477efc06b2cc2c31c2
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/gtk/3
lib/notify
lib/json/glib
{% endblock %}

{% block bld_tool %}
bld/glib
bld/gettext
{% endblock %}

{% block meson_flags %}
notify=enabled
{% endblock %}
