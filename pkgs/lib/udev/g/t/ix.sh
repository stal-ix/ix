{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libgudev
{% endblock %}

{% block fetch %}
https://github.com/GNOME/libgudev/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block lib_deps %}
lib/c
lib/udev
lib/glib
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/gudev-1.0 \${CPPFLAGS}"
{% endblock %}
