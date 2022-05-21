{% extends '//die/meson.sh' %}

{% block fetch %}
https://git.pwmt.org/pwmt/girara/-/archive/0.3.7/girara-0.3.7.tar.bz2
sha:22fabe7ccf2e8ac49aba7c5e7ad7dbd0cd33a9c69d673a2c4089d0675da4c0a2
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/gtk/3
lib/json/c
{% endblock %}

{% block bld_tool %}
bld/gettext
bld/glib/codegen
{% endblock %}

{% block meson_flags %}
notify=disabled
{% endblock %}
