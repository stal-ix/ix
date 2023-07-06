{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/GNOME/libgudev/archive/refs/tags/237.tar.gz
sha:4565d5abce6f71198c7c8ac3cecb30a007df7caf230094e09a6d61763f452a80
#https://github.com/GNOME/libgudev/archive/refs/tags/238.tar.gz
#sha:443c702c6339775f413f45d13309b2c641a94530bb27981142a2605eedb0aafd
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
