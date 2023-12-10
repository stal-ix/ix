{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libsecret/-/archive/0.21.2/libsecret-0.21.2.tar.bz2
sha:fb6ad4a4fdbd02492ba2f58e4bc205d2c4d9468f92a06c234258b88d121f1515
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
