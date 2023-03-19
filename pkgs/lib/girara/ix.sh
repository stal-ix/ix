{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://git.pwmt.org/pwmt/girara/-/archive/0.4.0/girara-0.4.0.tar.bz2
sha:4a22929d4239699630ecdac4394d400e964d11cf329f20475ae44db87e9fd181
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
