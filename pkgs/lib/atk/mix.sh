{% extends '//die/meson.sh' %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/atk/-/archive/ATK_2_36_0/atk-ATK_2_36_0.tar.bz2
cc1fdad773045e47651cc2722b236584
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
{% endblock %}

{% block bld_tool %}
bld/glib/codegen
{% endblock %}

{% block meson_flags %}
introspection=false
{% endblock %}

{% block env_lib %}
export CPPFLAGS="-I${out}/include/atk-1.0 \${CPPFLAGS}"
{% endblock %}
