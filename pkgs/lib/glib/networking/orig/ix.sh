{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/glib-networking/-/archive/2.72.1/glib-networking-2.72.1.tar.bz2
sha:bb0248149ae165cc611cd907ffcf03bb05f9f9b82b35e912a108a2fcdf4345e7
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/openssl
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
