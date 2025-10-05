{% extends '//die/c/autorehell.sh' %}

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
bld/glib
bld/gtkdoc
bld/python
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block c_flags %}
-Wno-incompatible-function-pointer-types
{% endblock %}

{% block configure_flags %}
--disable-pixbuf-loader
--enable-introspection=no
{% endblock %}

{% block patch %}
sed -e 's|GLIB_MKENUMS=.*|GLIB_MKENUMS=glib-mkenums|' -i configure.ac
find . -type f | while read l; do
    sed -e 's|HAVE_INTROSPECTION|FALSE|' -i ${l}
done
{% endblock %}

{% block configure %}
sed -e 's|.*GOBJECT_.*||' -i configure
{{super()}}
{% endblock %}

{% block cpp_missing %}
libxml/tree.h
{% endblock %}
