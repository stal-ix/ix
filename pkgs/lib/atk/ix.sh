{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
at-spi2-core
{% endblock %}

{% block version %}
2.58.2
{% endblock %}

{% block fetch %}
https://github.com/GNOME/at-spi2-core/archive/refs/tags/{{self.version().strip()}}.tar.gz
b68f4ccea0a7fdbaf6b0cb3f151906fc060cc000c64d60b621679a29d79d8bb5
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
