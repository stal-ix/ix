{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libgudev
{% endblock %}

{% block version %}
238
{% endblock %}

{% block fetch %}
https://github.com/GNOME/libgudev/archive/refs/tags/{{self.version().strip()}}.tar.gz
sha:443c702c6339775f413f45d13309b2c641a94530bb27981142a2605eedb0aafd
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
