{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://git.pwmt.org/pwmt/girara/-/archive/0.3.8/girara-0.3.8.tar.bz2
sha:078ccf934bec62f9b3468a5fcd7a24118e720172030649e77aaf4be1d37232e5
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/gtk/3
lib/json/c
{% endblock %}

{% block bld_tool %}
bld/gettext
bld/glib
{% endblock %}

{% block meson_flags %}
notify=disabled
{% endblock %}
