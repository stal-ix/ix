{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/at-spi2-core/2.56/at-spi2-core-2.56.0.tar.xz
sha:80d7e8ea0be924e045525367f909d6668dfdd3e87cd40792c6cfd08e6b58e95c
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
