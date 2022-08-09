{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://download.gnome.org/sources/gdk-pixbuf/2.42/gdk-pixbuf-2.42.9.tar.xz
sha:28f7958e7bf29a32d4e963556d241d0a41a6786582ff6a5ad11665e0347fc962
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
man=false
tests=false
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
