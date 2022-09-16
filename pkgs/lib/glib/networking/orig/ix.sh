{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/glib-networking/-/archive/2.74.0/glib-networking-2.74.0.tar.bz2
sha:1a82476cc0702d763b35bf79ccddb443a9e1cbdb49bc63ff2420578dcf03711f
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/openssl
{% endblock %}

{% block bld_tool %}
bld/glib/codegen
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
