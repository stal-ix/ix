{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/at-spi2-core/2.54/at-spi2-core-2.54.0.tar.xz
sha:d7eee7e75beddcc272cedc2b60535600f3aae6e481589ebc667afc437c0a6079
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/dbus
lib/xml/2
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}

{% block meson_flags %}
atk_only=true
introspection=disabled
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/atk-1.0 \${CPPFLAGS}"
{% endblock %}
