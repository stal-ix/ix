{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
at-spi2-core
{% endblock %}

{% block version %}
2.62.0.1
{% endblock %}

{% block fetch %}
https://github.com/GNOME/at-spi2-core/archive/refs/tags/{{self.version().strip()}}.tar.gz
24a6c1fc763f3874f9338cba38952fa9fef68b1028719cdce1eecf49549785bd
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
