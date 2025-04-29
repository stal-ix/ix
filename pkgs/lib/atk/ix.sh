{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
at-spi2-core
{% endblock %}

{% block version %}
2.56.2
{% endblock %}

{% block fetch %}
https://download.gnome.org/sources/at-spi2-core/2.56/at-spi2-core-{{self.version().strip()}}.tar.xz
sha:e1b1c9836a8947852f7440c32e23179234c76bd98cd9cc4001f376405f8b783b
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
