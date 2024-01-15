{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://git.pwmt.org/pwmt/girara/-/archive/0.4.2/girara-0.4.2.tar.bz2
sha:ce79d5d69fa0d2004b1d322ee6fe86a8e3a2b4628db57b4e4d88f318af46c044
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
