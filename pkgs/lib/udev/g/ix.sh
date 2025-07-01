{% extends '//die/c/meson.sh' %}

# noauto

{% block pkg_name %}
libgudev
{% endblock %}

{% block version %}
237
{% endblock %}

{% block fetch %}
https://github.com/GNOME/libgudev/archive/refs/tags/{{self.version().strip()}}.tar.gz
4565d5abce6f71198c7c8ac3cecb30a007df7caf230094e09a6d61763f452a80
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
