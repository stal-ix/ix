{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
at-spi2-core
{% endblock %}

{% block version %}
2.56.1
{% endblock %}

{% block fetch %}
https://download.gnome.org/sources/at-spi2-core/2.56/at-spi2-core-{{self.version().strip()}}.tar.xz
sha:fd177fecd8c95006ff0a355eafd7066fe110a2e17eb5eb5fe17ff70e49a4eace
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
