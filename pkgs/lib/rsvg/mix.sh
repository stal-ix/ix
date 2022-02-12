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
lib/glib
bld/python
{% endblock %}

{% block setup %}
export CPPFLAGS="-w ${CPPFLAGS}"
{% endblock %}

{% block configure_flags %}
--disable-pixbuf-loader
--enable-introspection=no
{% endblock %}

{% block patch %}
sed -e 's|GLIB_MKENUMS=.*|GLIB_MKENUMS=glib-mkenums|' -i configure.ac
{% endblock %}
