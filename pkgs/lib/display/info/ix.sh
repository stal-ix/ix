{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://gitlab.freedesktop.org/emersion/libdisplay-info/-/archive/0.2.0/libdisplay-info-0.2.0.tar.bz2
sha:f6cf2ddbba3753ae38de5113d1fcb8fab977dfaf5fb07b38cd68d8482765e208
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_data %}
aux/hwdata
{% endblock %}
