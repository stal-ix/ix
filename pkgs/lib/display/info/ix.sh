{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libdisplay-info
{% endblock %}

{% block version %}
0.3.0
{% endblock %}

{% block version_sha %}
915cc6713b7b2e173a90f9db248fb8994f9668171fecc1e9fded5e36bb34d890
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/emersion/libdisplay-info/-/archive/{{self.version().strip()}}/libdisplay-info-{{self.version().strip()}}.tar.bz2
{{self.version_sha().strip()}}
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_data %}
aux/hwdata
{% endblock %}
