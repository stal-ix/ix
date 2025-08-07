{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
at-spi2-core
{% endblock %}

{% block version %}
2.56.4
{% endblock %}

{% block fetch %}
https://download.gnome.org/sources/at-spi2-core/2.56/at-spi2-core-{{self.version().strip()}}.tar.xz
dbe35b951499e1d6f1fb552c2e0a09cea7cba2adf6c2eba0b2c85b6c094a3a02
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
