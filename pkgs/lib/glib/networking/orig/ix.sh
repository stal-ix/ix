{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
glib-networking
{% endblock %}

{% block version %}
2.80.1
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/glib-networking/-/archive/{{self.version().strip()}}/glib-networking-{{self.version().strip()}}.tar.bz2
06a8d5ea075e6dd6518af61e3c975d0adc80cba704387476b315561bfb6af88c
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/proxy
lib/openssl
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}

{% block meson_flags %}
gnutls=disabled
openssl=enabled
gnome_proxy=disabled
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
mv gio/modules/*.a ./
rm -r gio
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}
