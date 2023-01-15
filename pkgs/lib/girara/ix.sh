{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://git.pwmt.org/pwmt/girara/-/archive/0.3.9/girara-0.3.9.tar.bz2
sha:f44a7d1f78d54fa2dda361f8cdbcbbbdb226758310fba98d3296f9f4eeead283
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
