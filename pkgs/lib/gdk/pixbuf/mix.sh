{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/gdk-pixbuf/2.42/gdk-pixbuf-2.42.6.tar.xz
7cd2fdaa3c55e2302316fe36968f7425
{% endblock %}

{% block lib_deps %}
lib/c
lib/png
lib/tiff
lib/jpeg
lib/glib
{% endblock %}

{% block bld_tool %}
lib/glib
{% endblock %}

{% block meson_flags %}
-Dbuiltin_loaders=all
-Drelocatable=true
-Dinstalled_tests=false
-Dgio_sniffing=false
{% endblock %}

{% block install %}
{{super()}}

cd ${out}/lib/pkgconfig

cat gdk-pixbuf-2.0.pc \
    | grep -v 'bin' \
    > _ && mv _ gdk-pixbuf-2.0.pc
{% endblock %}
