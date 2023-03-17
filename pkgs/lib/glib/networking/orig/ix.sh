{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/glib-networking/-/archive/2.76.0/glib-networking-2.76.0.tar.bz2
sha:e63e08a7bcb3aa21f04117a5ee57dd5386989a82e16811cc407efaabca781124
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/openssl
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}

{% block meson_flags %}
openssl=enabled
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
mv gio/modules/*.a ./
rm -r gio
{% endblock %}

{% block patch %}
find . -type f -name meson.build | while read l; do
    sed -e 's|if .*static_.*shared.*|if false|' -i ${l}
done
{% endblock %}
