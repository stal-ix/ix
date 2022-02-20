{% extends '//mix/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/libsecret/-/archive/0.20.4/libsecret-0.20.4.tar.bz2
sha:8367c885f564109b9e8d54ac661073c8863396d942f18d6c5e538e9eda60e881
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
lib/gcrypt
{% endblock %}

{% block bld_tool %}
bin/xsltproc
bin/glib/codegen
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
