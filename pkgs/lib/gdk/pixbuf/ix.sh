{% extends '//die/meson.sh' %}

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
bld/glib/codegen
{% endblock %}

{% block meson_flags %}
builtin_loaders=all
relocatable=true
installed_tests=false
gio_sniffing=false
{% endblock %}

{% block patch %}
(base64 -d | patch -p1) << EOF
{% include '0.diff/base64' %}
EOF
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|.*bin.*||' -i ${out}/lib/pkgconfig/gdk-pixbuf-2.0.pc
{% endblock %}

{% block env_lib %}
export CPPFLAGS="-I${out}/include/gdk-pixbuf-2.0 \${CPPFLAGS}"
{% endblock %}
