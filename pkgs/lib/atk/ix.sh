{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
at-spi2-core
{% endblock %}

{% block version %}
2.62.1
{% endblock %}

{% block fetch %}
https://github.com/GNOME/at-spi2-core/archive/refs/tags/{{self.version().strip()}}.tar.gz
54ac3f44ce3b053b0778e0e6c15357f8c8ff293dad84e1a67d793e02d9f4f4ef
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
