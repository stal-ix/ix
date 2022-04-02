{% extends '//mix/autorehell.sh' %}

{% block fetch %}
{% include 'ver.sh' %}
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/croco
lib/cairo
lib/pango
lib/gdk/pixbuf
{% endblock %}

{% block bld_tool %}
bld/python
bld/glib/codegen
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block configure_flags %}
--disable-pixbuf-loader
--enable-introspection=no
{% endblock %}

{% block patch %}
sed -e 's|GLIB_MKENUMS=.*|GLIB_MKENUMS=glib-mkenums|' -i configure.ac
{% endblock %}
