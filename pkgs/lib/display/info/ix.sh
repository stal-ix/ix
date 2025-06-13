{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libdisplay-info
{% endblock %}

{% block version %}
0.2.0
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/emersion/libdisplay-info/-/archive/{{self.version().strip()}}/libdisplay-info-{{self.version().strip()}}.tar.bz2
f6cf2ddbba3753ae38de5113d1fcb8fab977dfaf5fb07b38cd68d8482765e208
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_data %}
aux/hwdata
{% endblock %}
