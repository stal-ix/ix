{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://github.com/lxde/menu-cache/archive/refs/tags/1.1.0.tar.gz
sha:990857aa61a2894730e3749b6bc0f905967eed0c21aa2b62a7694007bdccbe8d
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
{% endblock %}

{% block bld_libs %}
lib/fm/extra
{% endblock %}

{% block bld_tool %}
bin/gtk/doc
bld/intltool
{% endblock %}

{% block configure_flags %}
--disable-gtk-doc
{% endblock %}

{% block setup %}
export CFLAGS="-fcommon ${CFLAGS}"
{% endblock %}
