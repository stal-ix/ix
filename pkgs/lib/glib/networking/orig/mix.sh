{% extends '//mix/template/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/glib-networking/-/archive/2.70.1/glib-networking-2.70.1.tar.bz2
sha:88b860fb85b035371ca80ccc65889ee3f177ea7903cc42e32646d40c90f36e1f
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/gnutls
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
