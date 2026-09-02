{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libcloudproviders
{% endblock %}

{% block version %}
0.4.1
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/World/libcloudproviders/-/archive/{{self.version().strip()}}/libcloudproviders-{{self.version().strip()}}.tar.bz2
ca597f88a59fa775a4ad5c64ef5be9b92de01a58608989cd38d48ce075bb2768
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}

{% block meson_tool %}
bld/meson/9
{% endblock %}
