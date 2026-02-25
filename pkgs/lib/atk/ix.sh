{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
at-spi2-core
{% endblock %}

{% block version %}
2.58.3
{% endblock %}

{% block fetch %}
https://github.com/GNOME/at-spi2-core/archive/refs/tags/{{self.version().strip()}}.tar.gz
9103162c4d3367c202585a907b072e4b08c6f5c3d3eec75504392c7dc5a5206b
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
