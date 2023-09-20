{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libsecret/-/archive/0.21.1/libsecret-0.21.1.tar.bz2
sha:9a080030e7ec0458ca3112ef5e99acbce072f107b059da22459b4ca3d9308d0c
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/gcrypt
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}

{% block meson_flags %}
manpage=false
gtk_doc=false
debugging=false
introspection=false
{% endblock %}

{% block c_rename_symbol %}
SECMEM_pool_data_v1_0
{% endblock %}
