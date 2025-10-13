{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
at-spi2-core
{% endblock %}

{% block version %}
2.58.1
{% endblock %}

{% block fetch %}
https://github.com/GNOME/at-spi2-core/archive/refs/tags/{{self.version().strip()}}.tar.gz
780544354db3f6b3e4cc0c6dcdf3bfbaac93970a7a1e7e659f24c7308e2b0a1a
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
