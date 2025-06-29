{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
at-spi2-core
{% endblock %}

{% block version %}
2.56.3
{% endblock %}

{% block fetch %}
https://download.gnome.org/sources/at-spi2-core/2.56/at-spi2-core-{{self.version().strip()}}.tar.xz
0e41e1fc6a1961b38b4f9c0bea64bad30efff75949b7cdb988d2f2fdab72267a
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
