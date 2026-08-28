{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libcloudproviders
{% endblock %}

{% block version %}
0.4.0
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/World/libcloudproviders/-/archive/{{self.version().strip()}}/libcloudproviders-{{self.version().strip()}}.tar.bz2
fb19d1874789c0ab527fad28bf68717ad6708ec4c3ad18696c316f1d168fb175
{% endblock %}

{% block lib_deps %}
lib/c
lib/glib
{% endblock %}

{% block bld_tool %}
bld/glib
{% endblock %}
