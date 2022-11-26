{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://download-fallback.gnome.org/sources/libgudev/237/libgudev-237.tar.xz
md5:a7783083cd74957d3a727ddc4737ee84
{% endblock %}

{% block lib_deps %}
lib/c
lib/udev
lib/glib
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}

{% block env_lib %}
export CPPFLAGS="-I${out}/include/gudev-1.0 \${CPPFLAGS}"
{% endblock %}
