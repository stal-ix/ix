{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libcloudproviders
{% endblock %}

{% block version %}
0.4.2
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/World/libcloudproviders/-/archive/{{self.version().strip()}}/libcloudproviders-{{self.version().strip()}}.tar.bz2
b4a19db800dca213dd3df99f317d80d8ca40124cb2fb710bdbd428b3ab4c6550
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
