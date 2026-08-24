{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
ddcutil
{% endblock %}

{% block version %}
2.2.7
{% endblock %}

{% block fetch %}
https://github.com/rockowitz/ddcutil/archive/refs/tags/v{{self.version().strip()}}.tar.gz
7b5cb9824c23974241146f4a696abc65f8e9d1e950198c8dc00e4a5c6a2f41ee
{% endblock %}

{% block bld_libs %}
lib/c
lib/usb
lib/drm
lib/glib
lib/kernel
lib/jansson
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}
