{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/at-spi2-core/2.54/at-spi2-core-2.54.1.tar.xz
sha:f0729e5c8765feb1969bb6c1fba18afa2582126b0359aa75a173fda1acf93c4c
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
